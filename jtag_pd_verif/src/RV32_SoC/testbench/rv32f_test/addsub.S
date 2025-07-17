# Test for Floating-Point Multiplication
# This test performs floating-point multiplication using RISC-V floating-point instructions.

.section .data
# Test data
a:      .word 0x3F800000  # 1.0 in IEEE 754
b:      .word 0x40000000  # 2.0 in IEEE 754
result: .word 0x00000000  # Placeholder for the result

.section .text
.globl _start

_start:



#     # TEST 1: Floating-Point Division 3.4028235e38/-3.4028235e38
#     li t1, 0xff7fffff       # Load immediate value for `b` (-3.4028235e38 in IEEE 754)
#     fmv.w.x ft1, t1         # Move `b` into floating-point register ft1
#     li t1, 0x7f7fffff       # Load immediate value for `a` (3.4028235e38 in IEEE 754)
#     fmv.w.x ft0, t1         # Move `a` into floating-point register ft0         
#     nop
#     nop
#     nop

#    # Perform floating-point division
#     fdiv.s fa2, ft0, ft1    # fa2 = ft0 / ft1

#     # Uncomment the following lines to test other operations

    # TEST 2: Floating-Point Addition 1.0 + 2.0
    # li t1, 0x3f800000       # Load immediate value for `a` (1.0 in IEEE 754)
    # fmv.w.x ft0, t1         # Move `a` into floating-point register ft0         
    # li t1, 0x40000000       # Load immediate value for `b` (2.0 in IEEE 754)
    # fmv.w.x ft1, t1         # Move `b` into floating-point register ft1
    # Perform floating-point addition
    # fadd.s fa2, ft0, ft1    # fa2 = ft0 + ft1          



    # # TEST 3: Floating-Point Negate Multiplication and Sub -(-1.17912495e29*(-0.0)) - (-0.0)
    # li t1, 0x001e9cf2       # Load immediate value for `a` (-1.17912495e29 in IEEE 754)
    # fmv.w.x ft0, t1         # Move `a` into floating-point register ft0

    # li t1, 0xff7fffff       # Load immediate value for `b` (-0.0 in IEEE 754)
    # fmv.w.x ft1, t1         # Move `b` into floating-point register ft1

    # li t1, 0x80000000       # Load immediate value for `c` (-0.0 in IEEE 754)
    # fmv.w.x ft2, t1         # Move `b` into floating-point register ft2


    # # Perform floating-point Negate multiplcation and subtraction  (FNMSUB.S)
    # fnmsub.s fa2, ft0, ft1, ft2  # fa2 = -(ft0 * ft1) - ft2




    # # TEST 4: Floating-Point Multiplication 1.0 * 2.0
    # li t1, 0x3f800000  # Load immediate value for `a` (1.0 in IEEE 754)
    # fmv.w.x ft0, t1         # Move `a` into floating-point register fa0

    # li t1, 0x40000000  # Load immediate value for `b` (2.0 in IEEE 754)
    # fmv.w.x ft1, t1         # Move `b` into floating-point register fa1

    # # Perform floating-point multiplication
    # fmul.s fa0, ft0, ft1    # fa2 = fa0 * fa1

    # # TEST 2: Floating-Point Multiplication 
    # li t1, 0xab0e8597  # Load immediate value for `a` (1.0 in IEEE 754)
    # fmv.w.x ft0, t1         # Move `a` into floating-point register fa0

    # li t1, 0x8074de30  # Load immediate value for `b` (2.0 in IEEE 754)
    # fmv.w.x ft1, t1         # Move `b` into floating-point register fa1

    # # Perform floating-point multiplication
    # fmul.s fa1, ft0, ft1    # fa2 = fa0 * fa1


#     # TEST 5: FCVT.S.W - Floating-Point Conversion from Word to Single
#     li s10, 0xcd26ec16 
    
#    # Perform floating-point Conversion from Word to Single
#     fcvt.s.w ft0, s10         # Move `s10` into floating-point register ft0


    # # TEST 6: Floating-Point Addition 2.0 + -5.7249e29
    # li t1, 0x40000000       # Load immediate value for `a` (1.0 in IEEE 754)
    # fmv.w.x ft0, t1         # Move `a` into floating-point register ft0         
    # li t1, 0xf0e73a35       # Load immediate value for `b` (-5.7249e29 in IEEE 754)
    # fmv.w.x ft1, t1         # Move `b` into floating-point register ft1
    # # Perform floating-point addition
    # fadd.s fa2, ft0, ft1, rup    # fa2 = ft0 + ft1  

#     # TEST 7: FCVT.W.S - Floating-Point Conversion from Single to Word
#     li t0, 0x00000001
#     fmv.w.x ft0, t0         # Move `t0` into floating-point register ft0
    
#    # Perform floating-point Conversion from Word to Single
#     fcvt.w.s s10, ft0, rup         # Move `s10` into floating-point register ft0 


    # # TEST 8: Floating-Point Subtraction -853087200 - (-853087200)
    # li t1, 0xce4b6450       # Load immediate value for `a` (-853087200 in IEEE 754)
    # fmv.w.x ft0, t1         # Move `a` into floating-point register ft0         
    # li t1, 0xce4b6450       # Load immediate value for `b` (-853087200 in IEEE 754)
    # fmv.w.x ft1, t1         # Move `b` into floating-point register ft1
    
    # nop
    # nop
    # nop
    # # Perform floating-point subtraction with rounding mode 3'b001
    # fsub.s fa2, ft0, ft1, rtz    # fa2 = ft0 - ft1

    # # TEST 9: Floating-Point Addition (-infinity) + (-infinity)
    # li t1, 0xff800000       # Load immediate value for `a` (-infinity in IEEE 754)
    # fmv.w.x ft0, t1         # Move `a` into floating-point register ft0         
    # li t1, 0xff800000       # Load immediate value for `b` (-infinity in IEEE 754)
    # fmv.w.x ft1, t1         # Move `b` into floating-point register ft1
    # # Perform floating-point addition
    # fadd.s fa2, ft0, ft1, rne

    # # TEST 10: Floating-Point Addition 3.697755e^-31 + (-0.0)
    # li t1, 0x0cefff7e       # Load immediate value for `a` (3.697755e^-31 in IEEE 754)
    # fmv.w.x ft0, t1         # Move `a` into floating-point
    # li t1, 0x80000000       # Load immediate value for `b` (-0.0 in IEEE 754)
    # fmv.w.x ft1, t1         # Move `b` into floating-point
    # # Perform floating-point addition
    # fadd.s fa2, ft0, ft1, rdn



    # # TEST 11: Floating-Point Subtraction 1.0 - 2.2957E-41
    # li t1, 0x3f800000       # Load immediate value for `a` (1.0 in IEEE 754)
    # fmv.w.x ft0, t1         # Move `a` into floating-point
    # li t1, 0x00003fff      # Load immediate value for `b` (2.2957E-41 in IEEE 754)
    # fmv.w.x ft1, t1         # Move `b` into floating-point
    # # Perform floating-point subtraction
    # fsub.s fa2, ft0, ft1, rtz    # fa2 = ft0 - ft1

    # # TEST 12: Floating-Point Addition 1.0 + 2.89e^24
    # li t1, 0x3f800000       # Load immediate value for `a` (1.0 in IEEE 754)
    # fmv.w.x ft0, t1         # Move `a` into floating-point
    # li t1, 0x68191b90       # Load immediate value for `b` (2.89e^24 in IEEE 754)
    # fmv.w.x ft1, t1         # Move `b` into floating-point
    # # Perform floating-point addition   
    # fadd.s fa2, ft0, ft1, rup    # fa2 = ft0 + ft1


# #     # TEST 13: FCVT.WU.S - Floating-Point Conversion from Single to Word  Unsigned
#     li t0, 0x00000045
#     fmv.w.x ft0, t0         # Move `t0` into floating-point register ft0
    
#     fcvt.w.s s10, ft0, rup    


# #     # TEST 14: FCVT.WU.S - Floating-Point Conversion from Single to Word  Unsigned
#     li t0, 0x0cefff7e       # Load immediate value for `t0` (3.697755e^-31 in IEEE 754)
#     fmv.w.x ft0, t0         # Move `t0` into floating-point register ft0
    
#     fcvt.wu.s s10, ft0, rne      


# #     # TEST 15: FCVT.S.WU - Floating-Point Conversion from Word to Single Unsigned
#     li t0, 0x41000000  # Load immediate value for `t0` (8.0 in IEEE 754)
#     fmv.w.x ft0, t0         # Move `t0` into floating-point register ft0
#     fcvt.s.wu ft1, t0, rup         # Move `       t0` into floating-point register ft1


# #     # TEST 16: FCVT.S.W - Floating-Point Conversion from single to word signed
#     li t0, 0xceecf79f # Load immediate value for `t0` (-1.9878e^9 in IEEE 754)
#     fmv.w.x ft0, t0         # Move `t0` into floating-point register ft0
#     fcvt.w.s t1, ft0, rdn         # Move `       t0` into floating-point register ft1



    # # # TEST 17: Floating-Point Subtraction 
    # li t1, 0xce800000       # Load immediate value for `a`
    # fmv.w.x ft0, t1         # Move `a` into floating-point register ft0
    # li t1, 0x4eeeea69       # Load immediate value for `b`
    # fmv.w.x ft1, t1         # Move `b` into floating
    # # Perform floating-point subtraction
    # fsub.s fa2, ft0, ft1, rdn    # fa2 = ft0 - ft1


    # # # TEST 18: Floating-Point Subtraction 
    # li t1, 0xd40c559f       # Load immediate value for `a`
    # fmv.w.x ft0, t1         # Move `a` into floating
    # li t1, 0x540c559f       # Load immediate value for `b`
    # fmv.w.x ft1, t1         # Move `b` into floating
    # # Perform floating-point subtraction
    # fsub.s fa2, ft0, ft1, rtz    # fa2 = ft0 - ft1

    # # # TEST 19: Floating-Point Conversion from Single to Word Unsigned
    # li t1, 0x4f800000       # Load immediate value for `a` 
    # fmv.w.x ft0, t1         # Move `a` into floating-point register ft0
    # # Perform floating-point conversion from single to word unsigned
    # fcvt.wu.s s10, ft0, rtz         # Move `s10` into floating-point register ft0

    # # TEST 20: Floating-Point Subtractions NaN - NaN
    # li t1, 0x7fc00000       # Load immediate value for `a` (NaN in IEEE 754)
    # fmv.w.x ft0, t1         # Move `a` into floating-point register ft0         
    # li t1, 0x7fc00000       # Load immediate value for `b` (NaN in IEEE 754)
    # fmv.w.x ft1, t1         # Move `b` into floating-point register ft1
    # # Perform floating-point subtraction
    # fsub.s fa2, ft0, ft1, rup    # fa2 = ft0 - ft1

    # # TEST 21: Floating-Point Conversion from Single to Word Signed 
    # li t1, 0x4296aeee       
    # fmv.w.x ft0, t1      
    # fcvt.w.s s10, ft0, rne



    # # TEST 22: Floating-Point Subtractions -6.1324387e33 - (-6.1324387e33)
    # li t1, 0xf7972d21
    # fmv.w.x ft0, t1                
    # li t1, 0xf7972d21     
    # fmv.w.x ft1, t1      
    # # Perform floating-point subtraction
    # fsub.s fa2, ft0, ft1, rdn    # fa2 = ft0 - ft1



    # # TEST 23: Floating-Point Subtractions -6.1324387e33 - (-6.1324387e33)
    # li t1, 0x4f7fffff
    # fmv.w.x ft0, t1                
    # li t1, 0x4fc00208     
    # fmv.w.x ft1, t1      
    # # Perform floating-point subtraction
    # fsub.s fa2, ft0, ft1, rne    # fa2 = ft0 - ft1


    # TEST 24: Floating-Point Addition
    # li t1, 0x4fb09f6d
    # fmv.w.x ft0, t1                
    # li t1, 0x4f800000     
    # fmv.w.x ft1, t1      
    # # Perform floating-point subtraction
    # fadd.s fa2, ft0, ft1, rne    # fa2 = ft0 - ft1


    # # TEST 25: Floating-Point Conversion from Word unsigned to Single 
    # li t1, 0x73a26d5b
    # fcvt.s.wu ft0, t1, rmm


    # # TEST 26: Floating-Point Addition 
    # li t1, 0x8064e0a0
    # fmv.w.x ft0, t1
    # fadd.s fa2, ft0, ft0, rne   


    # # TEST 27: Floating-Point Addition 
    # li t1, 0x7f7fffff
    # fmv.w.x ft0, t1
    # fadd.s fa2, ft0, ft0, rdn  

    # # TEST 28: Floating-Point Addition
    # li t1, 0x00800000
    # fmv.w.x ft0, t1                
    # li t1, 0x007082b2    
    # fmv.w.x ft1, t1      
    # fadd.s fa2, ft0, ft1, rne  

    # # TEST 29: Floating-Point Sub
    # li t1, 0x80800000
    # fmv.w.x ft0, t1                
    # li t1, 0x80041024    
    # fmv.w.x ft1, t1      
    # fsub.s fa2, ft0, ft1, rdn  

    # # TEST 30: Floating-Point Sub
    # li t1, 0x7f7fffff
    # fmv.w.x ft0, t1                
    # li t1, 0xfc8ef536    
    # fmv.w.x ft1, t1      
    # fsub.s fa2, ft0, ft1, rtz  


    # # TEST 31: Floating-Point Sub
    # li t1, 0x83fff930
    # fmv.w.x ft0, t1                
    # li t1, 0x840004b7    
    # fmv.w.x ft1, t1      
    # fsub.s fa2, ft0, ft1, rmm  

    # # TEST 32: Floating-Point Sub
    # li t1, 0x072ffe0b
    # fmv.w.x ft0, t1                
    # li t1, 0x072ffdeb    
    # fmv.w.x ft1, t1      
    # fsub.s fa2, ft0, ft1, rmm  


    # # TEST 33: Floating-Point Sub
    # li t1, 0x82c21559
    # fmv.w.x ft0, t1                
    # li t1, 0x82c21411   
    # fmv.w.x ft1, t1      
    # fsub.s fa2, ft0, ft1, rne

    # TEST 33: Floating-Point Sub
    li t1, 0x0124fc94
    fmv.w.x ft0, t1                
    li t1, 0x01555553   
    fmv.w.x ft1, t1      
    fsub.s fa2, ft0, ft1, rne

    nop
    nop
    nop