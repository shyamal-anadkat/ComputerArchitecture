// ror_2.asm

lbi r1, 0
lbi r2, 15
ror r3, r1, r2 // Shift 0 by 15 bits (Should still be 0)
halt
