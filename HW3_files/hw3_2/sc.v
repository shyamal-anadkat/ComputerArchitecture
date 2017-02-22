/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */

module sc( clk, rst, ctr_rst, out, err);
   input clk;
   input rst;
   input ctr_rst;
   output [2:0] out;
   output err;

   // your code
	wire [2:0]  	state;
	reg [2:0]	next_state, out;
	reg		err;
	wire		reset;
	
	dff curr_state[2:0] (
			.q 	(state),
			.d	(next_state),
			.clk	(clk),
			.rst	(rst));

	or2 or_1 (.a(rst), .b(ctr_rst), .out(reset));

	always @ (*) begin
	  case (state)
		3'b000: begin
			next_state = reset ? 3'b000 : 3'b001;
	   		out = 3'h0;
			err = 1'b0;
	        end
		3'b001: begin
			next_state = reset ? 3'b000 : 3'b010;
                        out = 3'h1;
                        err = 1'b0;
		end
		3'b010: begin
			next_state = reset ? 3'b000 : 3'b011;
                        out = 3'h2;
                        err = 1'b0;
	        end
		3'b011: begin
			next_state = reset ? 3'b000 : 3'b100;
                        out = 3'h3;
			err = 1'b0;
	        end
		3'b100: begin
			next_state = reset ? 3'b000 : 3'b101;
                        out = 3'h4;
			err = 1'b0;
	        end
		3'b101: begin 
	   		next_state = reset ? 3'b000 : 3'b101;
                        out = 3'h5;
                        err = 1'b0;
	        end
		default: begin
			err = 1'b1;
		end //default
	endcase
      end // always @ (*)
endmodule

// DUMMY LINE FOR REV CONTROL :1:
