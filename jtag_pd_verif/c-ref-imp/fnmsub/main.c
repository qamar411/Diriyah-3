#include <stdio.h>
#include <math.h>
#include <stdint.h>

int main() {
    // Inputs
    uint32_t a_bits = 0xEFBE7557; // IEEE 754 representation of `a`
    uint32_t b_bits = 0x80000000; // IEEE 754 representation of `b` (-0.0)
    uint32_t c_bits = 0x80000000; // IEEE 754 representation of `c` (-0.0)

    // Convert inputs to float
    float a = *(float*)&a_bits;
    float b = *(float*)&b_bits;
    float c = *(float*)&c_bits;

    // Perform FNMSUB operation: d = -(a * b) - c
    float d = -(a * b) - c;

    // Convert result to IEEE 754 representation
    uint32_t d_bits = *(uint32_t*)&d;

    // Print the result
    printf("Result of FNMSUB.S: %.1f (Hex: 0x%08X)\n", d, d_bits);

    return 0;
}