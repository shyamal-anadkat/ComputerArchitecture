module seqdev ( 
	
	input Clk, 
	input Reset,
	input InA,

	output [15:0] Out
	);
	
  wire[1:0]    state;
  reg[1:0]     next_state;

  dff curr_state[1:0] (
		.q   (state), 
		.d   (next_state),
		.clk (Clk),
		.rst (Reset));

always @ () begin 
 case (state)
   // .... state 0, state 1, etc 

endmodule 
