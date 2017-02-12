module and16(In1, In2, Out);

    input [15:0] In1, In2;
    output [15:0] Out;
    
    and2 a1(.in1(In1[0]),.in2(In2[0]),.out(Out[0]));
    and2 a2(.in1(In1[1]),.in2(In2[1]),.out(Out[1]));
    and2 a3(.in1(In1[2]),.in2(In2[2]),.out(Out[2]));
    and2 a4(.in1(In1[3]),.in2(In2[3]),.out(Out[3]));
    and2 a5(.in1(In1[4]),.in2(In2[4]),.out(Out[4]));
    and2 a6(.in1(In1[5]),.in2(In2[5]),.out(Out[5]));
    and2 a7(.in1(In1[6]),.in2(In2[6]),.out(Out[6]));
    and2 a8(.in1(In1[7]),.in2(In2[7]),.out(Out[7]));
    and2 a9(.in1(In1[8]),.in2(In2[8]),.out(Out[8]));
    and2 a10(.in1(In1[9]),.in2(In2[9]),.out(Out[9]));
    and2 a11(.in1(In1[10]),.in2(In2[10]),.out(Out[10]));
    and2 a12(.in1(In1[11]),.in2(In2[11]),.out(Out[11]));
    and2 a13(.in1(In1[12]),.in2(In2[12]),.out(Out[12]));
    and2 a14(.in1(In1[13]),.in2(In2[13]),.out(Out[13]));
    and2 a15(.in1(In1[14]),.in2(In2[14]),.out(Out[14]));
    and2 a16(.in1(In1[15]),.in2(In2[15]),.out(Out[15]));

endmodule
