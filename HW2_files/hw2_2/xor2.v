module xor2(a, b, out);
	input a, b; 
	output out; 
	wire invA, invB, out1, out2;

	not1 not_a (.in1(a), .out(invA));
	not1 not_b (.in1(b), .out(invB));

	and2 a1 (.a(a), .b(invB), .out(out1));
	and2 a2 (.a(invA), .b(b), .out(out2));

	or2 o1 (.a(out1), .b(out2), .out(out));
endmodule 
