init:             
                  li x1, 0x1
                  li x2, 0x2
                  li x3, 0x3
                  li x4, 0x4
                  li x5, 0x5
                  li x6, 0x6

main:             
                  add   x7, x1, x2       # x7 = x1 + x2 = 3
                  sub   x8, x3, x1       # x8 = x3 - x1 = 2
                  and   x9, x4, x5       # x9 = x4 & x5 = 0x4
                  or    x10, x2, x3      # x10 = x2 | x3 = 0x3
                  sll   x11, x1, x2      # x11 = x1 << 2 = 4
                  xor   x12, x5, x6      # x12 = x5 ^ x6 = 3
