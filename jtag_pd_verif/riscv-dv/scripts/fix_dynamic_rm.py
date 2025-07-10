import sys
import re
import argparse

ROUNDING_MODES = {'rne', 'rtz', 'rdn', 'rup', 'rmm'}

# Instructions that require rounding modes and their expected operand counts (excluding rm)
ROUNDING_OPS = {
    'fmadd.s': 4,
    'fnmadd.s': 4,
    'fnmsub.s': 4,
    'fnmsub.s': 4,
    'fadd.s': 3,
    'fsub.s': 3,
    'fmul.s': 3,
    'fdiv.s': 3,
    'fsqrt.s': 2,
    'fcvt.w.s': 2,
    'fcvt.s.w': 2,
    'fcvt.wu.s': 2,
    'fcvt.s.wu': 2
}

# FP ops that never take rounding modes
NON_ROUNDING_OPS = {
    'feq.s', 'flt.s', 'fle.s', 'fsgnj.s', 'fsgnjn.s', 'fsgnjx.s',
    'fmv.x.w', 'fmv.w.x', 'fclass.s', 'fmin.s', 'fmax.s', 'flw', 'fsw'
}

def patch_rm_line(line, default_rm):
    # Extract label if any (e.g., 'main:')
    label_match = re.match(r'^(\s*\w+:)?\s*(\S+)\s+(.*)$', line)
    if not label_match:
        return line  # Skip malformed lines or comments

    label = label_match.group(1) or ''
    instr = label_match.group(2)
    operands_str = label_match.group(3)
    operands = [op.strip() for op in operands_str.split(',') if op.strip()]

    if instr not in ROUNDING_OPS:
        return line

    expected_ops = ROUNDING_OPS[instr]

    # Check if rounding mode already present
    if len(operands) == expected_ops + 1 and operands[-1] in ROUNDING_MODES:
        return line

    if len(operands) == expected_ops:
        new_line = f"{label or ''}\t{instr}\t{', '.join(operands)}, {default_rm}\n"
        return new_line

    return line


def process_file(path, default_rm):
    with open(path, 'r') as f:
        lines = f.readlines()

    new_lines = []
    for line in lines:
        if any(fp_op in line for fp_op in ROUNDING_OPS):
            new_lines.append(patch_rm_line(line, default_rm))
        else:
            new_lines.append(line)

    with open(path, 'w') as f:
        f.writelines(new_lines)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('asm_file', help="Input .S file")
    parser.add_argument('--rounding-mode', default='rne', help="Default RM to insert (default: rne)")
    args = parser.parse_args()

    process_file(args.asm_file, args.rounding_mode)
