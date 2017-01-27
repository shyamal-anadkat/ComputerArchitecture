module fulladder1_bench;

   reg  A;
   reg  B;
   reg  [1:0]Sumcalc;
   reg  Cin; 
   
   wire       SUM;
   wire       CO;
   wire	      Clk;
   //2 dummy wires
   wire rst;
   wire err;
   clkrst my_clkrst( .clk(Clk),.rst(rst),.err(err));
   fulladder_1 DUT (.A(A), .B(B),.Cin(Cin),.S(SUM),.Cout(CO));
   
  
   initial
     begin
	A = 1'b0;
	B = 1'b0;
	Cin = 1'b0;
	#3200 $finish;
     end
   
   always@(posedge Clk) 
     begin
	A = $random;
	B = $random;
	Cin = $random; 
     end
   
   always@(negedge Clk)
     begin
	Sumcalc = A+B+Cin;
	$display("A : %x, B: %x, Cin: %x,  Sum: %x, Cout: %x", A, B, Cin, SUM, CO);
	
	if (Sumcalc[0] !== SUM) $display ("ERRORCHECK Sum error");
	if (Sumcalc[1] !== CO) $display ("ERRORCHECK CO error");
     end
   
endmodule // tb_fulladder

