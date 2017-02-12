module alu (A, B, Cin, Op, invA, invB, sign, Out, Ofl, Z);
   
        input [15:0] A;
        input [15:0] B;
        input Cin;
        input [2:0] Op;
        input invA;
        input invB;
        input sign;
        output [15:0] Out;
        output Ofl;
        output Z;



		always @(*) begin
            case(Op)
                3'b000: begin // rotate left
                end
                3'b001: begin // shift left
                end
                3'b010: begin // shift right arith
    			end
    			3'b011: begin // shift right logical
    			end
    			3'b100: begin // A + B
    			end
    			3'b101: begin // A OR B
    			end
    			3'b110: begin // A XOR B
    			end
    			3'b111: begin // A AND B
    			end
    			default: begin
    			end
    		endcase
    	end
endmodule
