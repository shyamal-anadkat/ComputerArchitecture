module fulladder16(A, B, SUM, CO);
	input [15:0] A, B; 
	output [15:0] SUM;
	output CO; 

	wire w1,w2,w3; 
	
	fulladder4 r1 (.A(A[3:0]),.B(B[3:0]),.CI(1'b0),.SUM(SUM[3:0]),.CO(w1));
	fulladder4 r2 (.A(A[7:4]),.B(B[7:4]),.CI(w1),.SUM(SUM[7:4]),.CO(w2));
	fulladder4 r3 (.A(A[11:8]),.B(B[11:8]),.CI(w2),.SUM(SUM[11:8]),.CO(w3));
	fulladder4 r4 (.A(A[15:12]),.B(B[15:12]),.CI(w3),.SUM(SUM[15:12]),.CO(CO));

endmodule 

