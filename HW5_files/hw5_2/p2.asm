// Write your assembly program for Problem 2 (a) here.
lbi r3, 0
beqz r3, 2
and r1, r2, r3
add r2, r2, r2
nop 
halt
