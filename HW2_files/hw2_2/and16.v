module and16(In1, In2, Out);

    input [15:0] In1, In2;
    output [15:0] Out;
    
    and2 amod[15:0] (.in1(In1),.in2(In2),.out(Out));

endmodule
