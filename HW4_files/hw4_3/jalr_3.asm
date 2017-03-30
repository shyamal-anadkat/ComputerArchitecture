// jalr_3.asm

lbi r1, 6
jalr r1, 0 // PC = 6+0 = 6 after execution
lbi r1, 16 // Should not execute
halt
