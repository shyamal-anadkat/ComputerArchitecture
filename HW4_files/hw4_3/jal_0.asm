// jal_0

// This should skip over all the lbi instructions.
// r1, r2 and r3 should not be 128, and r7 should be 2.

jal 6
lbi r1, 128
lbi r2, 128
lbi r3, 128
halt
