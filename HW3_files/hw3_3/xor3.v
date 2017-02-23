module xor3 (a, b, c, out);
    input a, b, c;
    output out;
    wire out1;

    xor2 out_1 (.a(a), .b(b), .out(out1));
    xor2 out_2 (.a(out1), .b(c), .out(out));

endmodule
