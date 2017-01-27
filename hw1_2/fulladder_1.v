module fulladder_1 (
	input A, B, Cin,
	output S, Cout);
	wire xorab,nandab,xor2;
	
	xor2 x1(.in1(A),.in2(B),.out(xorab));
	xor2 x2(.in1(xorab),.in2(Cin),.out(S));

	nand2 n1(.in1(A),.in2(B), .out(nandab));
	nand2 n2(.in1(xorab),.in2(Cin),.out(xor2));
	nand2 n3(.in1(xor2),.in2(nandab),.out(Cout));
endmodule
