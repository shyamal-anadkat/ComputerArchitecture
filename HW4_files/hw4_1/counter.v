module counter(push, pop, rst, clk, curr_state);
input push, pop, rst, clk;
output [3:0] curr_state;

wire [3:0] next_state, move_amount, tmp_next;
reg [3:0] nextReg;


dff dmod1(.q (curr_state[0]), .d((next_state[0])), .clk (clk), .rst (rst));
dff dmod2(.q (curr_state[1]), .d((next_state[1])), .clk (clk), .rst (rst));
dff dmod3(.q (curr_state[2]), .d((next_state[2])), .clk (clk), .rst (rst));
dff dmod4(.q (curr_state[3]), .d((next_state[3])), .clk (clk), .rst (rst));


assign move_amount = push - pop;
assign tmp_next = curr_state + move_amount;
always @* casex ({curr_state == 4'b0, curr_state == 4'b0100, move_amount == 4'b0001, move_amount == -4'b0001, rst})
         5'b????1: nextReg = 4'b0000;
         5'b1??1?: nextReg = 0;
         5'b?11??: nextReg = 4;
         5'b?????: nextReg = tmp_next;        
endcase
assign next_state = nextReg;

endmodule