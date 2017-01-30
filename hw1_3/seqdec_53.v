module seqdec_53(InA, Clk, Reset, Out);
	
	input InA, Clk, Reset; 
	output Out;

	wire [4:0]  	state;
	reg [4:0] 	next_state; 
	
	dff curr_state[4:0] (
			.q 	(state),
			.d	(next_state),
			.clk	(Clk),
			.rst	(Reset));
	
	always @ (*) begin
	  case (state) 
		5'h0: begin 
	   		next_state = InA ? 5'h0 : 5'h1;
	        end
		5'h1: begin
			next_state = InA ? 5'h2: 5'h1; 
		end
		5'h2: begin 
	   		next_state = InA ? 5'h0 : 5'h3;
	        end
		5'h3: begin 
	   		next_state = InA ? 5'h4 : 5'h1;
	        end
		5'h4: begin 
	   		next_state = InA ? 5'h0 : 5'h5;
	        end
		5'h5: begin 
	   		next_state = InA ? 5'h2 : 5'h6;
	        end
		5'h6: begin 
	   		next_state = InA ? 5'h7 : 5'h1;
	        end
		5'h7: begin 
	   		next_state = InA ? 5'h8 : 5'h3;
	        end
		5'h8: begin 
	   		next_state = InA ? 5'h0 : 5'h1;
			//assign Out = 1;
	        end
		default: begin
			next_state = 5'h0;
		end //default
	endcase
      end // always @ (*)
		assign Out = (state == 5'h8) ? 1:0; 
endmodule 
