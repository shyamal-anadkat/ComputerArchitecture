module and2 (in1,in2,out);
input in1,in2;
output out;
wire w1; 

nand2 na1 (.in1(in1),.in2(in2),.out(w1));
nand2 na2 (.in1(w1),.in2(w1),.out(out));

endmodule