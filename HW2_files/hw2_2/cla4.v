module cla4 (A, B, Cin, Cout, PG, GG, S);
   
   input [3:0] A, B;
   input Cin;
   output [3:0] S;
   output Cout, PG, GG;  

   wire [3:0] G, P, C; 
   wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13;

   and2 a1(.in1(A),.in2(B),.out(G));
   or2 (.a(A),.b(B),.out(P));

   assign C[0] = Cin; 

   //for C[1]
   and2 a2(.in1(C[0]),.in2(P[0]),.out(w1));
   or2 o1(.a(w1),.b(G[0]),.out(C[1]));

   //for C[2]
   and2 a3(.in1(C[1]),.in2(P[1]),.out(w2));
   or2 o2(.a(w2),.b(G[1]),.out(C[2]));

   //for C[3]
   and2 a4(.in1(C[2]),.in2(P[2]),.out(w3));
   or2 o3(.a(w3),.b(G[2]),.out(C[3]));

   //for COut
   and2 a5(.in1(C[3]),.in2(P[3]),.out(w4));
   or2 o4(.a(w4),.b(G[3]),.out(COut));

   //PG Logic (P0&P1&P2&P3)
   and2 a6(.in1(P[2]),.in2(P[3]),.out(w5));
   and2 a7(.in1(P[0]),.in2(P[1]),.out(w6));
   and2 a8(.in1(w5),.in2(w6),.out(PG));

   //GG logic
   //G0P1P2P3
   and2 a9(.in1(w5),.in2(P[1]),.out(w7));
   and2 a10(.in1(w7),.in2(G[0]),.out(w8));
   //G1P3P2
   and2 a11(.in1(G[1]),.in2(P[3]),.out(w9));
   and2 a12(.in1(P[2]),.in2(w9),.out(w10));
   //G2P3
   and2 a13(.in1(G[2]),.in2(P[3]),.out(w11));

   or2 o5(.a(w8),.b(w10),.out(w12));
   or2 o6(.a(w12),.b(w11),.out(w13));
   or2 o7(.a(w13),.b(G[3]),.out(GG));

   // S logic
   or2 o8(.a(P),.b(C),.out(S));
   
endmodule

