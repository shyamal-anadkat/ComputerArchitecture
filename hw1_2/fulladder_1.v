module fulladder_1 (
	input A, B, Cin,
	output S, Cout);
	wire abx,abn,abx2;
	
	xor2 x1(.in1(A),.in2(B),.out(abx));
	xor2 x2(.in1(abx),.in2(Cin),.out(S));

	nand2 n1(.in1(A),.in2(B), .out(abn));
	nand2 n2(.in1(abx),.in2(Cin),.out(abx2));
	nand2 n3(.in1(abx2),.in2(abn),.out(Cout));
endmodule
