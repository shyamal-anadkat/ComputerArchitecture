// jalr_1.asm

	lbi r1, .jalr1
	lbi r2, .jalr2
	jalr r2, 0        // jump to .jalr2. r7 is pc value of halt below.
	halt              // Should not execute

.jalr1:
	halt		  // Will execute

.jalr2:
	jalr r1, 0        // jump to .jalr1. r7 is pc value of nop below.
	nop               // Should not execute (nop and halt).
	halt
