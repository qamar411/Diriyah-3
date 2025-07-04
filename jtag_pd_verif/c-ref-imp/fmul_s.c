/*============================================================================

This C source file is part of the SoftFloat IEEE Floating-Point Arithmetic
Package, Release 3d, by John R. Hauser.

Copyright 2011, 2012, 2013, 2014, 2015 The Regents of the University of
California.  All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright notice,
    this list of conditions, and the following disclaimer.

 2. Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions, and the following disclaimer in the documentation
    and/or other materials provided with the distribution.

 3. Neither the name of the University nor the names of its contributors may
    be used to endorse or promote products derived from this software without
    specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS "AS IS", AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, ARE
DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

=============================================================================*/

#include <stdbool.h>
#include <stdint.h> // This header already provides uint_fast32_t, int_fast16_t, uint_fast64_t
#include <string.h> // For memcpy, if needed for union type punning in a strict aliasing environment
#include <stdio.h>

// --- Minimal SoftFloat Type and Macro Definitions (from platform.h, specialize.h, softfloat.h) ---

// Removed redundant typedefs for uint_fast32_t, int_fast16_t, uint_fast64_t
// These are already provided by <stdint.h> and should be used directly.
// The specific sizes of 'fast' types are platform-dependent, as noted in stdint.h.

// Define float32_t
typedef union {
    float f;
    uint32_t ui;
} float32_t;

// Define union for type punning (from internals.h)
union ui32_f32 { uint32_t ui; float32_t f; };

// From softfloat.h (exception flags)
enum {
    softfloat_flag_inexact    = 1,
    softfloat_flag_underflow  = 2,
    softfloat_flag_overflow   = 4,
    softfloat_flag_divbyzero  = 8,
    softfloat_flag_invalid    = 16
};

// Global flags (simplified)
uint_fast8_t softfloat_exceptionFlags = 0;

void softfloat_raiseFlags( uint_fast8_t flags )
{
    softfloat_exceptionFlags |= flags;
}

// Default quiet NaN for single-precision (from softfloat.h)
// Exponent all 1s, MSB of significand 1, rest 0s.
const uint_fast32_t defaultNaNF32UI = 0xFFC00000;

// From specialize.h (macros to extract parts of F32)
#define signF32UI( ui ) ( (bool) ( (ui)>>31 ) )
#define expF32UI( ui ) ( (int_fast16_t) ( (ui)>>23 & 0xFF ) )
#define fracF32UI( ui ) ( (ui) & 0x007FFFFF )

// From specialize.h (macro to pack F32)
#define packToF32UI( sign, exp, sig ) ( ( (uint_fast32_t) (sign) << 31 ) + ( (uint_fast32_t) (exp) << 23 ) + (sig) )

// Structure for normalized subnormal (from internals.h)
struct exp16_sig32 { int_fast16_t exp; uint_fast32_t sig; };

// --- Helper Functions (transcribed from SoftFloat source) ---

// softfloat_isSigNaNF32UI (from specialize.h/internals.h, typically)
bool softfloat_isSigNaNF32UI( uint_fast32_t ui )
{
    return ( (ui & 0x7FC00000) == 0x7F800000 ) && ( ui & 0x003FFFFF );
}

// softfloat_normSubnormalF32Sig (from internals.h)
struct exp16_sig32 softfloat_normSubnormalF32Sig( uint_fast32_t sig )
{
    int_fast16_t exp;
    struct exp16_sig32 normExpSig;

    exp = 1;
    while ( ! ( sig & 0x00800000 ) ) {
        sig <<= 1;
        --exp;
    }
    normExpSig.exp = exp;
    normExpSig.sig = sig;
    return normExpSig;
}

// softfloat_roundPackToF32 (from softfloat_roundPackToF32.c)
// This is a simplified version for demonstration. A full version would
// involve rounding modes. For now, it assumes round-to-nearest-even.
float32_t softfloat_roundPackToF32( bool sign, int_fast16_t exp, uint_fast32_t sig )
{
    uint_fast32_t uiZ;
    union ui32_f32 uZ;

    // Check for overflow/infinity
    if ( exp >= 0xFF ) { // Exponent 0xFF is for infinity or NaN
        softfloat_raiseFlags( softfloat_flag_overflow | softfloat_flag_inexact );
        uiZ = packToF32UI( sign, 0xFF, 0 ); // Infinity
    } else if ( exp <= 0 ) { // Subnormal or zero
        // This is a very simplified handling for subnormals/zero.
        // Proper handling requires checking for underflow and rounding.
        softfloat_raiseFlags( softfloat_flag_underflow | softfloat_flag_inexact );
        uiZ = packToF32UI( sign, 0, 0 ); // Flush to zero for now
    } else {
        uiZ = packToF32UI( sign, exp, sig >> 7 ); // Shift back significand
    }

    uZ.ui = uiZ;
    return uZ.f;
}

// softfloat_shortShiftRightJam64 (from internals.h)
uint_fast32_t softfloat_shortShiftRightJam64( uint_fast64_t a, int_fast8_t count )
{
    if ( count <= 0 ) return (uint_fast32_t) a;
    if ( count >= 64 ) return ( a != 0 );
    return (uint_fast32_t) ( a >> count ) | ( ( a & ( ( 1ULL << count ) - 1 ) ) != 0 );
}

/*----------------------------------------------------------------------------
| Interpreting `uiA' and `uiB' as the bit patterns of two 32-bit floating-
| point values, at least one of which is a NaN, returns the bit pattern of
| the combined NaN result.  If either `uiA' or `uiB' has the pattern of a
| signaling NaN, the invalid exception is raised.
*----------------------------------------------------------------------------*/
uint_fast32_t softfloat_propagateNaNF32UI( uint_fast32_t uiA, uint_fast32_t uiB )
{
    if ( softfloat_isSigNaNF32UI( uiA ) || softfloat_isSigNaNF32UI( uiB ) ) {
        softfloat_raiseFlags( softfloat_flag_invalid );
    }
    return defaultNaNF32UI;
}

// --- f32_mul implementation ---

float32_t f32_mul( float32_t a, float32_t b )
{
    union ui32_f32 uA;
    uint_fast32_t uiA;
    bool signA;
    int_fast16_t expA;
    uint_fast32_t sigA;
    union ui32_f32 uB;
    uint_fast32_t uiB;
    bool signB;
    int_fast16_t expB;
    uint_fast32_t sigB;
    bool signZ;
    uint_fast32_t magBits;
    struct exp16_sig32 normExpSig;
    int_fast16_t expZ;
    uint_fast32_t sigZ, uiZ;
    union ui32_f32 uZ;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    uA.f = a;
    uiA = uA.ui;
    signA = signF32UI( uiA );
    expA  = expF32UI( uiA );
    sigA  = fracF32UI( uiA );
    uB.f = b;
    uiB = uB.ui;
    signB = signF32UI( uiB );
    expB  = expF32UI( uiB );
    sigB  = fracF32UI( uiB );
    signZ = signA ^ signB;
    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    if ( expA == 0xFF ) {
        if ( sigA || ((expB == 0xFF) && sigB) ) goto propagateNaN;
        magBits = expB | sigB;
        goto infArg;
    }
    if ( expB == 0xFF ) {
        if ( sigB ) goto propagateNaN;
        magBits = expA | sigA;
        goto infArg;
    }
    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    if ( ! expA ) {
        if ( ! sigA ) goto zero;
        normExpSig = softfloat_normSubnormalF32Sig( sigA );
        expA = normExpSig.exp;
        sigA = normExpSig.sig;
    }
    if ( ! expB ) {
        if ( ! sigB ) goto zero;
        normExpSig = softfloat_normSubnormalF32Sig( sigB );
        expB = normExpSig.exp;
        sigB = normExpSig.sig;
    }
    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    expZ = expA + expB - 0x7F;
    sigA = (sigA | 0x00800000) << 7; // Add implicit leading 1 and shift
    sigB = (sigB | 0x00800000) << 8; // Add implicit leading 1 and shift
    sigZ = softfloat_shortShiftRightJam64( (uint_fast64_t) sigA * sigB, 32 );
    if ( sigZ < 0x40000000 ) { // Check for product being < 1.0 (after normalization)
        --expZ;
        sigZ <<= 1;
    }
    return softfloat_roundPackToF32( signZ, expZ, sigZ );
    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
propagateNaN:
    uiZ = softfloat_propagateNaNF32UI( uiA, uiB );
    goto uiZ;
    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
infArg:
    if ( ! magBits ) {
        softfloat_raiseFlags( softfloat_flag_invalid );
        uiZ = defaultNaNF32UI;
    } else {
        uiZ = packToF32UI( signZ, 0xFF, 0 );
    }
    goto uiZ;
    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
zero:
    uiZ = packToF32UI( signZ, 0, 0 );
uiZ:
    uZ.ui = uiZ;
    return uZ.f;
}


int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <hex_float1> <hex_float2>\n", argv[0]);
        fprintf(stderr, "Example: %s 3f800000 40000000 (for 1.0 * 2.0)\n", argv[0]);
        return 1;
    }

    // Convert hex string inputs to uint32_t, then assign to float32_t union
    float32_t val1, val2;

    // Use strtol with base 16 for hexadecimal conversion
    // Cast to uint32_t as strtol returns long int
    val1.ui = (uint32_t)strtol(argv[1], NULL, 16);
    val2.ui = (uint32_t)strtol(argv[2], NULL, 16);

    // Perform the multiplication
    float32_t result = f32_mul(val1, val2);

    // Print the result in 32-bit hexadecimal format and also as float for verification
    printf("Input 1 (hex): 0x%08X (float: %f)\n", val1.ui, val1.f);
    printf("Input 2 (hex): 0x%08X (float: %f)\n", val2.ui, val2.f);
    printf("Result (hex):  0x%08X (float: %f)\n", result.ui, result.f);

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