module dec3_8 (in, outA, outB, outC, outD, outE, outF, outG, outH);
	input[2:0] in;
	output outA, outB, outC, outD, outE, outF, outG, outH;

	wire not_out_0, not_out_1, not_out_2;

	not1 not_0(.in1(in[0]), .out(not_out_0));
	not1 not_1(.in1(in[1]), .out(not_out_1));
	not1 not_2(.in1(in[2]), .out(not_out_2));

	and3 and_A(.a(not_out_0), .b(not_out_1), .c(not_out_2), .out(outA));
	and3 and_B(.a(in[0]), .b(not_out_1), .c(not_out_2), .out(outB));
	and3 and_C(.a(not_out_0), .b(in[1]), .c(not_out_2), .out(outC));
	and3 and_D(.a(in[0]), .b(in[1]), .c(not_out_2), .out(outD));
	and3 and_E(.a(not_out_0), .b(not_out_1), .c(in[2]), .out(outE));
	and3 and_F(.a(in[0]), .b(not_out_1), .c(in[2]), .out(outF));
	and3 and_G(.a(not_out_0), .b(in[1]), .c(in[2]), .out(outG));
	and3 and_H(.a(in[0]), .b(in[1]), .c(in[2]), .out(outH));

endmodule
