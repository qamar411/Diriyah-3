#include <stdio.h>
#include <stdint.h>

int main() {
    // Inputs in IEEE 754 format
    uint32_t a_bits = 0x40000000; // 2.0 in IEEE 754
    uint32_t b_bits = 0xF0E73A35; // -5.7249e29 in IEEE 754

    // Convert inputs to float
    float a = *(float*)&a_bits;
    float b = *(float*)&b_bits;

    // Perform the addition
    float result = a + b;

    // Convert result to IEEE 754 format
    uint32_t result_bits = *(uint32_t*)&result;

    // Print the inputs and result
    printf("a = %.10e (Hex: 0x%08X)\n", a, a_bits);
    printf("b = %.10e (Hex: 0x%08X)\n", b, b_bits);
    printf("Result = %.10e (Hex: 0x%08X)\n", result, result_bits);

    return 0;
}