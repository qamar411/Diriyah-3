# Updated SoCConsole with exec/run fix and robust split upload
import argparse
import cmd
import threading
import serial
import time
import zlib
import os
import subprocess

# === TARGET CONFIGURATION ===
DEFAULT_PORT    = "/dev/ttyUSB1"
BAUDRATE        = 115200

FLASH_BASE      = 0x00010000
IMEM_BASE       = 0x80000000
IMEM_SIZE       = 32 * 1024
DMEM_BASE       = 0x80040000
DMEM_SIZE       = 8 * 1024
TOTAL_FLASH_SIZE = IMEM_SIZE + DMEM_SIZE  # 0xA000 = 40KB

# Command codes
CMD_READY  = 0x43  # 'C'
CMD_START  = 0x53  # 'S'
CMD_FLASH  = 0x46  # 'F'
CMD_EXEC   = 0x58  # 'X'
CMD_UPLOAD = 0x55  # 'U'
CMD_RUN    = 0x52  # 'R'

STATUS_OK  = b"O"
STATUS_NAK = b"N"

CONVERT_HEX = "./convert_hex"
OBJCOPY = "riscv64-unknown-elf-objcopy"

class SoCConsole(cmd.Cmd):
    intro = (
        "Welcome to the SoC UART Console.\n"
        "Commands available: file, flash, upload, exec, run, exit\n"
        "Use 'help <command>' for more info.\n"
    )
    prompt = "soc> "

    def __init__(self, port, baud):
        super().__init__()
        try:
            self.ser = serial.Serial(port, baud, timeout=1.0)
            print(f"[UART open on {port} @ {baud}bps]")
        except Exception as e:
            print(f"Error opening {port}: {e}")
            exit(1)
        self._stop = threading.Event()
        self.elf_file = None
        threading.Thread(target=self._reader, daemon=True).start()

    def _reader(self):
        while not self._stop.is_set():
            try:
                b = self.ser.read(1)
            except:
                break
            if not b:
                continue
            c = b[0]
            print(f"\r< SOC: '{chr(c)}'" if 32 <= c <= 126 else f"\r< SOC: 0x{c:02X}", flush=True)
            print(self.prompt, end="", flush=True)

    def _handshake(self):
        print("🔄 Sending handshake (0x43)...")
        self.ser.write(bytes([CMD_READY]))
        echoed = self.ser.read(1)
        if not echoed or echoed[0] != CMD_READY:
            print("❌ Handshake failed.")
            return False
        print("✅ Handshake successful (got 0x43)")
        return True

    def _send_simple(self, cmd_byte, base=0, length=0):
        if not self._handshake():
            return
        frame = bytes([CMD_START, cmd_byte]) + base.to_bytes(4, 'big') + length.to_bytes(2, 'little')
        self.ser.write(frame)
        resp = self.ser.read(1)
        print("✅ OK" if resp == STATUS_OK else f"❌ NAK {resp.hex() if resp else '(timeout)'}")

    def _run_convert(self, elf_path):
        subprocess.run([OBJCOPY, "-O", "verilog", "-j", ".text", "-j", ".rom_helpers", "--gap-fill=0x00", "--pad-to=0x80008000", elf_path, "inst.hex"])
        subprocess.run([CONVERT_HEX, "inst.hex", "machine.hex"])
        subprocess.run([OBJCOPY, "-O", "verilog", "-j", ".data", "-j", ".rodata", "-j", ".bss", elf_path, "data.hex"])
        subprocess.run([CONVERT_HEX, "data.hex", "data.hex"])

    def _load_hex(self, path):
        data = bytearray()
        with open(path) as f:
            for line in f:
                h = line.strip()
                if not h:
                    continue
                if h.lower().startswith("0x"):
                    h = h[2:]
                word = int(h, 16)
                data += word.to_bytes(4, 'little')
        return data

    def _send_chunked_payload(self, cmd_byte, base, payload, wait_ready=True):
        self.ser.reset_input_buffer()
        if not self._handshake():
            return
        header = bytes([CMD_START, cmd_byte]) + base.to_bytes(4, 'big') + len(payload).to_bytes(2, 'little')
        checksum = zlib.adler32(payload) & 0xFFFFFFFF
        self.ser.write(header)

        if wait_ready:
            print("⏳ Waiting for flash erase to finish...")
            while True:
                ack = self.ser.read(1)
                if ack and ack[0] == CMD_READY:
                    print("✅ Ready to receive payload")
                    break

        print("📤 Sending payload in 256-byte chunks...")
        for i in range(0, len(payload), 256):
            chunk = payload[i:i+256]
            self.ser.write(chunk)
            if wait_ready:
                while True:
                    r = self.ser.read(1)
                    if r and r[0] == CMD_READY:
                        break

        self.ser.write(checksum.to_bytes(4, 'little'))
        print(f"✅ Checksum sent: 0x{checksum:08X}")

        print("⏳ Waiting for ACK/NAK...")
        start_time = time.time()
        while time.time() - start_time < 5:
            resp = self.ser.read(1)
            if resp:
                if resp[0] == 0x4F:
                    print("✅ Received ACK (0x4F)")
                    return
                elif resp[0] == 0x4E:
                    print("❌ Received NAK (0x4E)")
                    return
        print("❌ No ACK/NAK received within timeout.")

    def do_file(self, arg):
        if not os.path.isfile(arg):
            print("❌ ELF file not found")
            return
        self.elf_file = arg
        self._run_convert(self.elf_file)
        print(f"✅ ELF file set: {arg}")

    def do_flash(self, arg):
        if not self.elf_file:
            print("❌ Use 'file <elf>' first")
            return
        print("[Flashing 40KB image to flash @ 0x10000]")
        imem = self._load_hex("machine.hex")[:IMEM_SIZE]
        dmem = self._load_hex("data.hex")[:DMEM_SIZE]
        payload = imem + b'\x00' * (IMEM_SIZE - len(imem)) + dmem + b'\x00' * (DMEM_SIZE - len(dmem))
        self._send_chunked_payload(CMD_FLASH, FLASH_BASE, payload, wait_ready=True)

    def do_upload(self, arg):
        if not self.elf_file:
            print("❌ Use 'file <elf>' first")
            return
        print("[Uploading IMEM to SRAM…]")
        imem = self._load_hex("machine.hex")[:IMEM_SIZE]
        self._send_chunked_payload(CMD_UPLOAD, IMEM_BASE, imem, wait_ready=False)

        time.sleep(0.1)
        self.ser.reset_input_buffer()

        print("[Uploading DMEM to SRAM…]")
        dmem = self._load_hex("data.hex")[:DMEM_SIZE]
        self._send_chunked_payload(CMD_UPLOAD, DMEM_BASE, dmem, wait_ready=False)

    def do_exec(self, arg):
        print("[Executing from flash…]")
        self._send_simple(CMD_EXEC, 0, 0)

    def do_run(self, arg):
        print("[Running from SRAM @ 0x80000000]")
        self._send_simple(CMD_RUN, IMEM_BASE, 0)

    def do_exit(self, arg):
        self._stop.set()
        self.ser.close()
        return True

    do_EOF = do_exit

def main():
    parser = argparse.ArgumentParser(description="SoC UART console")
    parser.add_argument("-p", "--port", default=DEFAULT_PORT, help="Serial port")
    parser.add_argument("-b", "--baud", type=int, default=BAUDRATE, help="Baud rate")
    args = parser.parse_args()

    SoCConsole(args.port, args.baud).cmdloop()

if __name__ == "__main__":
    main()