import argparse
import cmd
import threading
import serial
import time
import zlib
import os

# === TARGET CONFIGURATION ===
DEFAULT_PORT    = "/dev/ttyUSB1"
BAUDRATE        = 115200

FLASH_IMEM_BASE = 0x00010000
IMEM_SIZE       = 32 * 1024
FLASH_DMEM_BASE = FLASH_IMEM_BASE + IMEM_SIZE
DMEM_SIZE       = 8 * 1024

# Command codes
CMD_READY  = 0x43  # 'C'
CMD_START  = 0x53  # 'S'
CMD_FLASH  = 0x46  # 'F'
CMD_EXEC   = 0x58  # 'X'
CMD_UPLOAD = 0x55  # 'U'
CMD_RUN    = 0x52  # 'R'

STATUS_OK  = b"O"
STATUS_NAK = b"N"


class SoCConsole(cmd.Cmd):
    intro = "SoC console. Type help for commands.\n"
    prompt = "soc> "

    def __init__(self, port, baud):
        super().__init__()
        try:
            self.ser = serial.Serial(port, baud, timeout=0.1)
            print(f"[UART open on {port} @ {baud}bps]")
        except Exception as e:
            print(f"Error opening {port}: {e}")
            exit(1)
        self._stop = threading.Event()
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
            if 32 <= c <= 126:
                print(f"\r< SOC: '{chr(c)}'")
            else:
                print(f"\r< SOC: 0x{c:02X}'")
            print(self.prompt, end="", flush=True)

    def _handshake(self):
        deadline = time.time() + 5
        while time.time() < deadline:
            self.ser.write(bytes([CMD_READY]))
            if self.ser.read(1) == bytes([CMD_READY]):
                return True
            time.sleep(0.05)
        print("❌ Handshake timed out")
        return False

    def _load_hex(self, path, size):
        data = bytearray()
        with open(path) as f:
            for line in f:
                h = line.strip()
                if not h:
                    continue
                if h.lower().startswith("0x"):
                    h = h[2:]
                if len(h) != 8:
                    raise ValueError("Each line must be 8 hex digits")
                word = int(h, 16)
                data += word.to_bytes(4, 'little')
        if len(data) > size:
            raise ValueError(f"Data {len(data)} > region {size}")
        data += b'\x00' * (size - len(data))
        return bytes(data)

    def _send_payload(self, cmd_byte, base, payload):
        if not self._handshake():
            return
        header = bytes([CMD_START, cmd_byte]) + base.to_bytes(4, 'big') + len(payload).to_bytes(2, 'little')
        crc = zlib.adler32(payload) & 0xFFFFFFFF
        self.ser.write(header)
        self.ser.write(payload)
        self.ser.write(crc.to_bytes(4, 'little'))
        resp = self.ser.read(1)
        if resp == STATUS_OK:
            print("✅ OK")
        else:
            print(f"❌ NAK {resp.hex() if resp else '(timeout)'}")

    def _send_simple(self, cmd_byte, base=0, length=0):
        if not self._handshake():
            return
        frame = bytes([CMD_START, cmd_byte]) + base.to_bytes(4, 'big') + length.to_bytes(2, 'little')
        self.ser.write(frame)
        resp = self.ser.read(1)
        if resp == STATUS_OK:
            print("✅ OK")
        else:
            print(f"❌ NAK {resp.hex() if resp else '(timeout)'}")

    def do_flash(self, arg):
        "flash BASE FILE — write FILE into flash at BASE"
        parts = arg.split()
        if len(parts) != 2:
            print("Usage: flash <base> <file>")
            return
        base_str, path = parts
        try:
            base = int(base_str, 0)
        except:
            print("❌ Invalid base")
            return
        if not os.path.isfile(path):
            print("❌ File not found")
            return
        try:
            # we allow any size: pad to next 256 multiple?
            payload = self._load_hex(path, os.path.getsize(path)*4//8 + 0)
        except ValueError as e:
            print(f"❌ {e}")
            return
        print(f"[Flashing {path} @ 0x{base:X}]")
        self._send_payload(CMD_FLASH, base, payload)

    def do_upload(self, arg):
        "upload BASE LENGTH FILE — write FILE into SRAM at BASE"
        parts = arg.split()
        if len(parts) != 3:
            print("Usage: upload <base> <length> <file>")
            return
        base_str, length_str, path = parts
        try:
            base = int(base_str, 0)
            length = int(length_str, 0)
        except:
            print("❌ Invalid base or length")
            return
        if not os.path.isfile(path):
            print("❌ File not found")
            return
        try:
            payload = self._load_hex(path, length)
        except ValueError as e:
            print(f"❌ {e}")
            return
        print(f"[Uploading {path} ({length} bytes) → SRAM@0x{base:X}]")
        self._send_payload(CMD_UPLOAD, base, payload)

    def do_exec(self, arg):
        "exec — load from flash into SRAM and run"
        print("[Executing from flash]")
        self._send_simple(CMD_EXEC)

    def do_run(self, arg):
        "run BASE — jump to code at SRAM BASE"
        base_str = arg.strip()
        if not base_str:
            print("Usage: run <base>")
            return
        try:
            base = int(base_str, 0)
        except:
            print("❌ Invalid base")
            return
        print(f"[Running from 0x{base:X}]")
        self._send_simple(CMD_RUN, base)

    def do_exit(self, arg):
        "exit — quit console"
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
