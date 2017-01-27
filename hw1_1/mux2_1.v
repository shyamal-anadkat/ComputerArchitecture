module mux2_1( 
	input InA, InB, S, 
	output Out );
	wire NotS, OutA, OutB; 
	
	not1 n1(S,NotS);
 	nand2 na1(InA, NotS, OutA);
	nand2 na2(S, InB, OutB);
	nand2 na3(OutA, OutB, Out);	
endmodule
 
