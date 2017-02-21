/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module rf (
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

   // your code

   //decoder 3-8 
   in : writeregsel
   out: [7:0] wire dec_out 

   //dffs
   reg16 [7:0] out : reg16 out [7:0]
               in: writedata
               en : wire dec_out 
               rst, clk same.

   //8 1 mux for read1data
   //inputs are out from reg16
   //sel is read1 sel
   //out is read1 data


   //8 1 mux for read2 data 
   //sel is read2 sel 
   //out is read2data



endmodule
// DUMMY LINE FOR REV CONTROL :1:
