#include <stdio.h>
#include <stdlib.h> // For strtof

// Include all the previous code (f32_mul, softfloat_propagateNaNF32UI,
// and all helper functions and definitions) above this main function.
// For brevity, I'm assuming you'll paste the entire code block provided
// earlier into a single file with this main function.

// You will paste the entire code provided previously above this main function.
// For example:
/*
// ... (Your entire previous C code for f32_mul and its helpers) ...
*/

// --- main function for testing ---
int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <float1> <float2>\n", argv[0]);
        return 1;
    }

    // Convert string inputs to float32_t
    float32_t val1, val2;
    val1.f = strtof(argv[1], NULL);
    val2.f = strtof(argv[2], NULL);

    // Perform the multiplication
    float32_t result = f32_mul(val1, val2);

    // Print the result in 32-bit hexadecimal format
    printf("Input 1 (float): %f (hex: 0x%08X)\n", val1.f, val1.ui);
    printf("Input 2 (float): %f (hex: 0x%08X)\n", val2.f, val2.ui);
    printf("Result (float):  %f (hex: 0x%08X)\n", result.f, result.ui);

    // Optionally, print exception flags
    if (softfloat_exceptionFlags) {
        printf("SoftFloat Exception Flags Raised: 0x%x\n", softfloat_exceptionFlags);
        if (softfloat_exceptionFlags & softfloat_flag_inexact)    printf("  - Inexact\n");
        if (softfloat_exceptionFlags & softfloat_flag_underflow)  printf("  - Underflow\n");
        if (softfloat_exceptionFlags & softfloat_flag_overflow)   printf("  - Overflow\n");
        if (softfloat_exceptionFlags & softfloat_flag_divbyzero)  printf("  - Divide by Zero\n");
        if (softfloat_exceptionFlags & softfloat_flag_invalid)    printf("  - Invalid\n");
    }

    return 0;
}