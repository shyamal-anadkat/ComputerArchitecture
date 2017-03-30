module fa2(A, B, SUM, Cout);

    input [1:0] A, B;
    output [1:0]SUM;
    output Cout;
    wire c1, c2;
    
    fa1 a1(.A(A[0]), .B(B[0]), .Cin(1'b0), .S(SUM[0]), .Cout(c1));
    fa1 a2(.A(A[1]), .B(B[1]), .Cin(c1), .S(SUM[1]), .Cout(c2));
    
    assign Cout = c2;
endmodule