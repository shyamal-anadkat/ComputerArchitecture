// ror_4.asm

// Common case (Check if ror works for random numbers)

lbi r1, 0x40
lbi r2, 4
ror r3, r1, r2 // r3 should be 4
halt
