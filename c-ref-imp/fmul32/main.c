#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

// Define the float32_t type
typedef struct { uint32_t v; } float32_t;

// Define the exp16_sig32 structure
typedef struct {
    int_fast16_t exp;
    uint_fast32_t sig;
} exp16_sig32;

// Define the union for float and uint32_t conversion
typedef union {
    uint32_t ui;
    float32_t f;
} ui32_f32;

// Define macros for extracting sign, exponent, and fraction
#define signF32UI(a) ((bool)((a) >> 31))
#define expF32UI(a) ((int_fast16_t)((a) >> 23 & 0xFF))
#define fracF32UI(a) ((a) & 0x007FFFFF)

// Define default NaN value
#define defaultNaNF32UI 0x7FC00000

// Function to normalize subnormal numbers
exp16_sig32 softfloat_normSubnormalF32Sig(uint_fast32_t sig) {
    int_fast16_t shiftDist = __builtin_clz(sig) - 8;
    printf("Normalizing subnormal: shiftDist=%d, sig=0x%06X\n", shiftDist, sig);
    return (exp16_sig32){1 - shiftDist, sig << shiftDist};
}

// Function to perform right shift with jamming
uint_fast32_t softfloat_shortShiftRightJam64(uint_fast64_t a, uint_fast8_t dist) {
    return (dist < 64) ? (a >> dist) | ((a & ((uint_fast64_t)1 << dist) - 1) != 0) : (a != 0);
}

// Function to round and pack the result
float32_t softfloat_roundPackToF32(bool sign, int_fast16_t exp, uint_fast32_t sig) {
    uint_fast32_t roundBits = sig & 0x7F;
    sig = (sig + 0x40) >> 7;
    sig &= ~((roundBits == 0x40) & (sig & 1));
    if (sig & 0x01000000) {
        ++exp;
        sig >>= 1;
    }
    if (0xFF <= (unsigned int)exp) {
        return (float32_t){sign ? 0xFF800000 : 0x7F800000};
    }
    if (exp < 1) {
        sig >>= 1 - exp;
        exp = 0;
    }
    return (float32_t){(sign << 31) + (exp << 23) + (sig & 0x007FFFFF)};
}

// Function to propagate NaN
uint_fast32_t softfloat_propagateNaNF32UI(uint_fast32_t uiA, uint_fast32_t uiB) {
    if (uiA & 0x00400000) return uiA;
    if (uiB & 0x00400000) return uiB;
    return defaultNaNF32UI;
}

// Function to raise flags (stub for now)
void softfloat_raiseFlags(uint_fast8_t flags) {
    // Implement flag handling if needed
}

// Function to pack sign, exponent, and fraction into a 32-bit float
uint_fast32_t packToF32UI(bool sign, int_fast16_t exp, uint_fast32_t frac) {
    return ((uint_fast32_t)sign << 31) + ((uint_fast32_t)exp << 23) + frac;
}

float32_t f32_mul(float32_t a, float32_t b) {
    ui32_f32 uA, uB, uZ;
    uint_fast32_t uiA, uiB, uiZ;
    bool signA, signB, signZ;
    int_fast16_t expA, expB, expZ;
    uint_fast32_t sigA, sigB, sigZ, magBits;
    exp16_sig32 normExpSig;

    uA.f = a;
    uiA = uA.ui;
    signA = signF32UI(uiA);
    expA = expF32UI(uiA);
    sigA = fracF32UI(uiA);

    uB.f = b;
    uiB = uB.ui;
    signB = signF32UI(uiB);
    expB = expF32UI(uiB);
    sigB = fracF32UI(uiB);

    signZ = signA ^ signB;

    // Debug: Print initial values
    printf("Step 1: Initial values\n");
    printf("A: sign=%d, exp=0x%02X, frac=0x%06X\n", signA, expA, sigA);
    printf("B: sign=%d, exp=0x%02X, frac=0x%06X\n", signB, expB, sigB);

    // Handle special cases for A
    if (expA == 0xFF) {
        if (sigA || ((expB == 0xFF) && sigB)) goto propagateNaN;
        magBits = expB | sigB;
        goto infArg;
    }
    if (!expA) {
        if (!sigA) goto zero;
        normExpSig = softfloat_normSubnormalF32Sig(sigA);
        expA = normExpSig.exp;
        sigA = normExpSig.sig;
        printf("Step 2: Normalized subnormal A\n");
        printf("A: exp=0x%02X, frac=0x%06X\n", expA, sigA);
    }

    // Handle special cases for B
    if (expB == 0xFF) {
        if (sigB) goto propagateNaN;
        magBits = expA | sigA;
        goto infArg;
    }
    if (!expB) {
        if (!sigB) goto zero;
        normExpSig = softfloat_normSubnormalF32Sig(sigB);
        expB = normExpSig.exp;
        sigB = normExpSig.sig;
        printf("Step 3: Normalized subnormal B\n");
        printf("B: exp=0x%02X, frac=0x%06X\n", expB, sigB);
    }

    // Perform multiplication
    expZ = expA + expB - 0x7F;
    sigA = (sigA | 0x00800000) << 7;
    sigB = (sigB | 0x00800000) << 8;
    printf("Step 4: Prepared significands for multiplication\n");
    printf("A: sig=0x%08X\n", sigA);
    printf("B: sig=0x%08X\n", sigB);

    sigZ = softfloat_shortShiftRightJam64((uint_fast64_t)sigA * sigB, 32);
    printf("Step 5: Multiplied significands\n");
    printf("Resulting sig=0x%08X\n", sigZ);

    // Normalize the result if necessary
    if (sigZ < 0x40000000) {
        --expZ;
        sigZ <<= 1;
        printf("Step 6: Normalized result\n");
        printf("exp=0x%02X, sig=0x%08X\n", expZ, sigZ);
    }

    // Handle underflow to subnormal or zero
    if (expZ < 1) {
        sigZ = softfloat_shortShiftRightJam64(sigZ, 1 - expZ);
        expZ = 0;
        printf("Step 7: Underflow to subnormal or zero\n");
        printf("exp=0x%02X, sig=0x%08X\n", expZ, sigZ);
    }

    // Round and pack the result
    printf("Step 8: Rounding and packing the result\n");
    float32_t result = softfloat_roundPackToF32(signZ, expZ, sigZ);
    printf("Final Result: sign=%d, exp=0x%02X, frac=0x%06X\n",
           signF32UI(result.v), expF32UI(result.v), fracF32UI(result.v));
    return result;

propagateNaN:
    uiZ = softfloat_propagateNaNF32UI(uiA, uiB);
    printf("Step 9: Propagating NaN\n");
    goto uiZ;

infArg:
    if (!magBits) {
        softfloat_raiseFlags(0x10); // softfloat_flag_invalid
        uiZ = defaultNaNF32UI;
        printf("Step 10: Invalid operation, returning default NaN\n");
    } else {
        uiZ = packToF32UI(signZ, 0xFF, 0);
        printf("Step 11: Infinity result\n");
    }
    goto uiZ;

zero:
    uiZ = packToF32UI(signZ, 0, 0);
    printf("Step 12: Zero result\n");

uiZ:
    uZ.ui = uiZ;
    return uZ.f;
}

void debug_f32_mul(uint32_t hexA, uint32_t hexB) {
    ui32_f32 a, b, result;
    a.ui = hexA;
    b.ui = hexB;

    printf("Input A: 0x%08X\n", hexA);
    printf("Input B: 0x%08X\n", hexB);

    // Extract components of A
    bool signA = signF32UI(a.ui);
    int_fast16_t expA = expF32UI(a.ui);
    uint_fast32_t fracA = fracF32UI(a.ui);

    // Extract components of B
    bool signB = signF32UI(b.ui);
    int_fast16_t expB = expF32UI(b.ui);
    uint_fast32_t fracB = fracF32UI(b.ui);

    // Debug: Print components of A and B
    printf("A: sign=%d, exp=0x%02X, frac=0x%06X\n", signA, expA, fracA);
    printf("B: sign=%d, exp=0x%02X, frac=0x%06X\n", signB, expB, fracB);

    // Check for special cases
    if (expA == 0xFF) {
        if (fracA) {
            printf("A is NaN\n");
        } else {
            printf("A is Infinity\n");
        }
    } else if (expA == 0) {
        if (fracA == 0) {
            printf("A is Zero\n");
        } else {
            printf("A is Subnormal\n");
        }
    } else {
        printf("A is Normalized\n");
    }

    if (expB == 0xFF) {
        if (fracB) {
            printf("B is NaN\n");
        } else {
            printf("B is Infinity\n");
        }
    } else if (expB == 0) {
        if (fracB == 0) {
            printf("B is Zero\n");
        } else {
            printf("B is Subnormal\n");
        }
    } else {
        printf("B is Normalized\n");
    }

    // Perform multiplication
    result.f = f32_mul(a.f, b.f);

    // Extract components of the result
    bool signZ = signF32UI(result.ui);
    int_fast16_t expZ = expF32UI(result.ui);
    uint_fast32_t fracZ = fracF32UI(result.ui);

    // Debug: Print components of the result
    printf("Result: sign=%d, exp=0x%02X, frac=0x%06X\n", signZ, expZ, fracZ);

    // Print final result in hexadecimal
    printf("Final Result: 0x%08X\n", result.ui);
}

int main() {
    uint32_t hexA, hexB;

    // Input two 32-bit hexadecimal numbers
    printf("Enter first 32-bit hex number (A): ");
    scanf("%x", &hexA);
    printf("Enter second 32-bit hex number (B): ");
    scanf("%x", &hexB);

    // Call the debug function
    debug_f32_mul(hexA, hexB);

    return 0;
}