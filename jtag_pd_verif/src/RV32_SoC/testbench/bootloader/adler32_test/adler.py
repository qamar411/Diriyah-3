import zlib

MOD_ADLER = 65521

def word_to_bytes_le(hexword):
    word = int(hexword, 16)
    return [
        (word >> 0) & 0xFF,
        (word >> 8) & 0xFF,
        (word >> 16) & 0xFF,
        (word >> 24) & 0xFF
    ]

def compute_adler32_from_file(filename):
    A = 1
    B = 0
    all_bytes = []

    with open(filename, 'r') as f:
        lines = f.readlines()

    log_lines = []
    log_lines.append(f"{'Byte':>4} | {'Char':^5} | {'A (Dec)':>8} {'A (Hex)':>8} | {'B (Dec)':>8} {'B (Hex)':>8}")
    log_lines.append("-" * 50)

    for line in lines:
        line = line.strip()
        if not line:
            continue
        byte_list = word_to_bytes_le(line)
        for byte in byte_list:
            A = (A + byte) % MOD_ADLER
            B = (B + A) % MOD_ADLER
            char_repr = chr(byte) if 32 <= byte <= 126 else '.'
            log_lines.append(f"{byte:>4} |  {char_repr:^5} | {A:>8} {A:>8X} | {B:>8} {B:>8X}")
            all_bytes.append(byte)

    checksum = (B << 16) | A
    log_lines.append("\n[Final Adler-32 Checksum]")
    log_lines.append(f"Checksum = (B << 16) | A = (0x{B:04X} << 16) | 0x{A:04X} = 0x{checksum:08X}")
    log_lines.append(f"Checksum (decimal): {checksum}")

    # Write log file
    with open("adler32.log", "w") as f:
        f.write("\n".join(log_lines))

    # Print only final checksum
    print(f"0x{checksum:08X}")

if __name__ == "__main__":
    compute_adler32_from_file("../boot_loader/machine.hex")
