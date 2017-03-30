// jalr_2.asm

// Test negative immediate

lbi r1, 0
lbi r2, 22
jalr r1, 14  // Should not execute halt after this.
nop
nop
nop
halt
nop    // Only PC should change for nop
nop
nop
jalr r2, -10 // Should execute halt after this.
