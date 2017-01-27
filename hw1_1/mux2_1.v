module mux2_1( 
	input InA, InB, S, 
	output Out );
	wire NotS, OutA, OutB; 
	
	not1 n1(.in1(S),.out(NotS));
 	nand2 na1(.in1(InA),.in2(NotS),.out(OutA));
	nand2 na2(.in1(S),.in2(InB),.out(OutB));
	nand2 na3(.in1(OutA),.in2(OutB),.out(Out));	
endmodule
 
