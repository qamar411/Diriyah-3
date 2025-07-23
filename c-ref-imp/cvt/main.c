// #include <stdio.h>
// #include <stdint.h>

// int main() {
//     // Hardcoded hexadecimal integer
//     uint32_t hexValue = 0xCD26EC20; // Input integer in hexadecimal format

//     // Print the integer in hex and decimal formats
//     printf("Integer (Hex): 0x%X\n", hexValue);
//     printf("Integer (Decimal): %u\n", hexValue);

//     // Convert to float
//     float floatValue = *(float*)&hexValue; // Interpret the bits as a float
//     printf("Converted Float (Decimal): %f\n", floatValue);
//     printf("Converted Float (Hex): 0x%X\n", floatValue);

//     return 0;
// }



#include <stdio.h>
#include <stdint.h>

int main() {
    // Hardcoded IEEE 754 smallest positive subnormal value
    uint32_t ieeeHex = 0x00000001;

    // Interpret the bits as a float using a union
    union {
        uint32_t intValue;
        float floatValue;
    } converter;

    converter.intValue = ieeeHex;

    // Print the floating-point value in decimal
    printf("Float (Decimal): %.50f\n", converter.floatValue);

    // Convert the float to an integer
    int32_t intValue = (int32_t)converter.floatValue;

    // Print the converted integer
    printf("Converted Integer (Decimal): %d\n", intValue);
    printf("Converted Integer (Hex): 0x%X\n", intValue);

    return 0;
}