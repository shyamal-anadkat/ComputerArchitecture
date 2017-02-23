/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
// SAnadkat Rajmohan 2/22

module rf_bypass (
           // Outputs
           read1data, read2data, err,
           // Inputs
           clk, rst, read1regsel, read2regsel, writeregsel, writedata, write
           );
   input clk, rst;
   input [2:0] read1regsel;
   input [2:0] read2regsel;
   input [2:0] writeregsel;
   input [15:0] writedata;
   input        write;

   output [15:0] read1data;
   output [15:0] read2data;
   output        err;

   wire bp1, bp2;
   wire [15:0] read1, read2;
   wire comp_out1, comp_out2; 

   //instantiate RegFile
   rf rfmod(
          // Outputs
          .read1data                    (read1),
          .read2data                    (read2),
          .err                          (err),
          // Inputs
          .clk                          (clk),
          .rst                          (rst),
          .read1regsel                  (read1regsel),
          .read2regsel                  (read2regsel),
          .writeregsel                  (writeregsel),
          .writedata                    (writedata),
          .write                        (write));

  
  //bp1 = 1 if read1sel = writeregsel && write
  //bp2 = 1 if read2sel = writeregsel && write 

  comparator3 cmp1(.a(read1regsel), .b(writeregsel), .out(comp_out1));
  comparator3 cmp2(.a(read2regsel), .b(writeregsel), .out(comp_out2));

  and2 a1(.a(comp_out1),.b(write),.out(bp1));
  and2 a2(.a(comp_out2),.b(write),.out(bp2));

  //select between write and read1
  mux2_1 bypass1mod [15:0] (.InA(read1),.InB(writedata),.S(bp1),.Out(read1data));
  mux2_1 bypass2mod [15:0] (.InA(read2),.InB(writedata),.S(bp2),.Out(read2data));

endmodule