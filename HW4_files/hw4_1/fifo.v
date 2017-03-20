/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module fifo(/*AUTOARG*/
   // Outputs
   data_out, fifo_empty, fifo_full, err,
   // Inputs
   data_in, data_in_valid, pop_fifo, clk, rst
   );
   input [63:0] data_in;
   input        data_in_valid;
   input        pop_fifo;

   input        clk;
   input        rst;
   output [63:0] data_out;
   output        fifo_empty;
   output        fifo_full;
   output        err;

   wire [63:0] fifo [3:0];
   reg [63:0] fifo_next [3:0];
   reg err;

   reg [63:0] outputdata;
   wire popEn, pushEn;
   wire [1:0] pop_state, pop_state_next;  
   wire [1:0] push_state, push_state_next;  
   wire[3:0] counter; 
   wire [1:0] pop_state_plus1, push_state_plus1;

   //DFFs for fifo data
   dff r1[63:0](.q(fifo[0]), .d(fifo_next[0]), .clk(clk), .rst(rst));
   dff r2[63:0](.q(fifo[1]), .d(fifo_next[1]), .clk(clk), .rst(rst));
   dff r3[63:0](.q(fifo[2]), .d(fifo_next[2]), .clk(clk), .rst(rst));
   dff r4[63:0](.q(fifo[3]), .d(fifo_next[3]), .clk(clk), .rst(rst)); 
   
   //increment states
   fa2 addr(.A(pop_state[1:0]), .B(2'b1), .SUM(pop_state_plus1));
   fa2 addw(.A(push_state[1:0]), .B(2'b1), .SUM(push_state_plus1));
   
   counter ctr(.push(pushEn), .pop(popEn), .rst(rst), .clk(clk), .curr_state(counter));
   
   always @* begin
    casex ({pushEn, push_state})
     3'b0xx: begin
      fifo_next[0] = fifo[0];
      fifo_next[1] = fifo[1];
      fifo_next[2] = fifo[2];
      fifo_next[3] = fifo[3];
      end
     3'b100: begin
      fifo_next[0] = data_in;
      fifo_next[1] = fifo[1];
      fifo_next[2] = fifo[2];
      fifo_next[3] = fifo[3];
      end
     3'b101: begin
      fifo_next[0] = fifo[0];
      fifo_next[1] = data_in;
      fifo_next[2] = fifo[2];
      fifo_next[3] = fifo[3]; 
      end
     3'b110: begin
      fifo_next[0] = fifo[0];
      fifo_next[1] = fifo[1];
      fifo_next[2] = data_in;
      fifo_next[3] = fifo[3];
      end
     3'b111:begin
      fifo_next[0] = fifo[0];
      fifo_next[1] = fifo[1];
      fifo_next[2] = fifo[2];
      fifo_next[3] = data_in; 
      end
    default:begin
      assign err = 1; 
      end
    endcase 
   end
   
   
   always @* begin
   	case(pop_state)
   		2'b00: outputdata = fifo[0];
   		2'b01: outputdata = fifo[1];
   		2'b10: outputdata = fifo[2];
   		2'b11: outputdata = fifo[3];
   	endcase
   end
   
   assign data_out = outputdata;
   assign data_out_valid = popEn;
   
   assign fifo_empty = (counter == 3'b000);
   assign fifo_full = (counter == 3'b100);
  
   assign popEn = pop_fifo & (~fifo_empty) | (fifo_full & pop_fifo & data_in_valid);
   assign pushEn = data_in_valid & (~fifo_full) | (fifo_empty & pop_fifo & data_in_valid);
              
   dff rs1[1:0](.q(pop_state), .d(pop_state_next), .clk(clk), .rst(rst));
   dff ws1[1:0](.q(push_state), .d(push_state_next), .clk(clk), .rst(rst));
   
   assign pop_state_next = ({2{popEn}} & pop_state_plus1) | ({2{~popEn}} & pop_state);
   assign push_state_next = (pushEn)? (push_state_plus1) : push_state;
      
endmodule
   