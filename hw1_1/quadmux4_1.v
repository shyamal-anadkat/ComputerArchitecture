module quadmux4_1 (
	input [3:0] InA, InB, InC, InD, [1:0] S,
	output [3:0] Out );

	mux4_1 mux0(InA[0], InB[0], InC[0], InD[0],S, Out[0]); 
	mux4_1 mux1(InA[1], InB[1], InC[1], InD[1],S, Out[1]);
	mux4_1 mux2(InA[2], InB[2], InC[2], InD[2],S, Out[2]);
	mux4_1 mux3(InA[3], InB[3], InC[3], InD[3],S, Out[3]);	

endmodule

