module fa1( A, B, Cin, S, Cout);
  
    input A, B, Cin;
    output S, Cout;
    wire x1, n1, n2;
    
    xor2 xr1(.in1(A), .in2(B), .out(x1));
    xor2 xr2(.in1(x1), .in2(Cin), .out(S));
    nand2 na1(.in1(A), .in2(B), .out(n1));
    nand2 na2(.in1(x1), .in2(Cin), .out(n2));
    nand2 na3(.in1(n2), .in2(n1), .out(Cout));
    
endmodule