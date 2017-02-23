//output 1 if input values(3 bit) are same 
//SAnadkat 2/22
module comparator3(a, b, out);

	input [2:0] a, b;
	output out; 

	wire x1_out,x2_out,x3_out,temp_out;

	xor2 x1(.in1(a[0]), .in2(b[0]), .out(x1_out));
	xor2 x2(.in1(a[1]), .in2(b[1]), .out(x2_out));
	xor2 x3(.in1(a[2]), .in2(b[2]), .out(x3_out));

	or3 ormod(.a(x1_out),.b(x2_out),.c(x3_out),.out(temp_out));

	//invert out to produce 1 when same inputs 
	not1 n1(.in1(temp_out),.out(out));

endmodule