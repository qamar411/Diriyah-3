#!/usr/bin/env python3
import argparse, serial, time, zlib, sys, os

# Protocol codes (must match your .S)
CMD_READY  = 0x43  # 'C'
CMD_START  = 0x53  # 'S'
CMD_FLASH  = 0x46  # 'F'
CMD_EXEC   = 0x58  # 'X'
CMD_UPLOAD = 0x55  # 'U'
CMD_RUN    = 0x52  # 'R'
STATUS_OK  = b'O'
STATUS_NAK = b'N'

# Memory layout
FLASH_IMEM_BASE = 0x00010000
IMEM_SIZE       = 32*1024
FLASH_DMEM_BASE = FLASH_IMEM_BASE + IMEM_SIZE
DMEM_SIZE       = 8*1024

def handshake(ser, timeout=2.0):
    print("→ Performing handshake (send 'C' until echoed)...", end="", flush=True)
    deadline = time.time() + timeout
    spinner = "|/-\\"
    idx = 0
    while time.time() < deadline:
        ser.write(bytes([CMD_READY]))
        echo = ser.read(1)
        if echo == bytes([CMD_READY]):
            print("\r✅ Handshake succeeded!            ")
            return True
        print(f"\r→ Handshake… {spinner[idx%4]}", end="", flush=True)
        idx += 1
        time.sleep(0.1)
    print("\r❌ Handshake timed out!             ")
    return False

def load_hex(path, pad=None):
    data = bytearray()
    with open(path) as f:
        for line in f:
            h = line.strip()
            if not h: continue
            if h.lower().startswith("0x"): h = h[2:]
            if len(h) != 8:
                raise ValueError("Each line must be exactly 8 hex digits")
            word = int(h,16)
            data += word.to_bytes(4, "little")
    if pad is not None:
        if len(data) > pad:
            raise ValueError(f"Data {len(data)}B > region {pad}B")
        data += b"\x00"*(pad-len(data))
    return bytes(data)

def send_frame(ser, cmd, base, payload=b""):
    if not handshake(ser):
        sys.exit(1)
    header = bytes([CMD_START, cmd]) \
           + base.to_bytes(4,"big") \
           + len(payload).to_bytes(2,"little")
    crc = zlib.adler32(payload)&0xFFFFFFFF
    ser.write(header + payload + crc.to_bytes(4,"little"))
    resp = ser.read(1)
    if resp==STATUS_OK:
        print("→ ✅ OK")
    else:
        print(f"→ ❌ NAK or timeout (got {resp})")
        sys.exit(1)

def send_simple(ser, cmd, base=0, length=0):
    if not handshake(ser):
        sys.exit(1)
    frame = bytes([CMD_START, cmd]) \
          + base.to_bytes(4,"big") \
          + length.to_bytes(2,"little")
    ser.write(frame)
    resp = ser.read(1)
    if resp==STATUS_OK:
        print("→ ✅ OK")
    else:
        print(f"→ ❌ NAK or timeout (got {resp})")
        sys.exit(1)

def main():
    p = argparse.ArgumentParser()
    p.add_argument("--port", default="/dev/ttyUSB1")
    p.add_argument("--baud", type=int, default=115200)
    grp = p.add_mutually_exclusive_group(required=True)
    grp.add_argument("--imem",  metavar="FILE", help="flash FILE to IMEM (32KB)")
    grp.add_argument("--dmem",  metavar="FILE", help="flash FILE to DMEM (8KB)")
    grp.add_argument("--exec",  action="store_true", help="load+run from flash")
    grp.add_argument("--upload", nargs=2, metavar=("ADDR","FILE"),
                     help="upload FILE into SRAM at ADDR")
    grp.add_argument("--run",   metavar="ADDR", help="jump to SRAM address ADDR")
    args = p.parse_args()

    # Open serial
    try:
        ser = serial.Serial(args.port, args.baud, timeout=0.1)
    except Exception as e:
        print(f"❌ Could not open {args.port}: {e}")
        sys.exit(1)

    try:
        if args.imem:
            payload = load_hex(args.imem, IMEM_SIZE)
            print(f"[Flashing IMEM ← {args.imem}]")
            send_frame(ser, CMD_FLASH, FLASH_IMEM_BASE, payload)

        elif args.dmem:
            payload = load_hex(args.dmem, DMEM_SIZE)
            print(f"[Flashing DMEM ← {args.dmem}]")
            send_frame(ser, CMD_FLASH, FLASH_DMEM_BASE, payload)

        elif args.exec:
            print("[Executing from flash]")
            send_simple(ser, CMD_EXEC)

        elif args.upload:
            addr = int(args.upload[0], 0)
            payload = load_hex(args.upload[1])
            print(f"[Uploading {args.upload[1]} → SRAM@0x{addr:X}]")
            send_frame(ser, CMD_UPLOAD, addr, payload)

        elif args.run:
            addr = int(args.run, 0)
            print(f"[Running SRAM@0x{addr:X}]")
            send_simple(ser, CMD_RUN, addr)

    finally:
        ser.close()

if __name__=="__main__":
    main()
