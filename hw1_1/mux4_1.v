module mux4_1(
	input InA, InB, InC, InD, [1:0] S,
	output Out);
	wire w1,w2; 

	mux2_1 mux1 (InA, InB, S[0], w1);
	mux2_1 mux2 (InC, InD, S[0], w2);
	mux2_1 mux3 (w1, w2, S[1], Out);

endmodule
