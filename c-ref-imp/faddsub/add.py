import struct
import math

# Function to simulate floating-point addition with RUP rounding
def fadd_rup(a_bits, b_bits):
    # Convert IEEE 754 bit patterns to floats
    a = struct.unpack('!f', struct.pack('!I', a_bits))[0]
    b = struct.unpack('!f', struct.pack('!I', b_bits))[0]

    # Perform the addition
    result = a + b

    # Simulate RUP rounding
    if result > 0:  # For positive results, round up
        result = math.ceil(result)
    elif result < 0:  # For negative results, truncate toward zero
        result = math.floor(result)

    # Convert the result back to IEEE 754 bit pattern
    result_bits = struct.unpack('!I', struct.pack('!f', result))[0]

    return result, result_bits

# Inputs in IEEE 754 format
a_bits = 0x40000000  # 2.0
b_bits = 0xF0E73A35  # -5.7249e29

# Perform addition with RUP rounding
result, result_bits = fadd_rup(a_bits, b_bits)

# Print results
print(f"a = {struct.unpack('!f', struct.pack('!I', a_bits))[0]} (Hex: {hex(a_bits)})")
print(f"b = {struct.unpack('!f', struct.pack('!I', b_bits))[0]} (Hex: {hex(b_bits)})")
print(f"Result = {result} (Hex: {hex(result_bits)})")