module cpu_main(
    	input clk,
    	input rst,
    	input [15:0] memory,
    	output reg [3:0] out
);

parameter NON = 4'b0000, ADD = 4'b0001, SUB = 4'b0010;

wire [3:0] opcode;
wire [3:0] input_A;
wire [3:0] input_B;
wire [3:0] add_out;
wire [3:0] sub_out;

cpu_memory Memory (
   	.clk(clk),
    	.rst(rst),
    	.memory(memory),
    	.opcode(opcode),
    	.input_A(input_A),
    	.input_B(input_B)
);

twos_adder Adder (
	.x(input_A),
	.y(input_B),
	.c_in(1'b0),
	.sum(add_out),
	.c_out()
);

twos_adder Substractor (
	.x(input_A),
	.y(input_B),
	.c_in(1'b1),
	.sum(sub_out),
	.c_out()
);

always @(posedge clk, negedge rst) begin
    	if (!rst) begin
        	out 	    <= 4'b0;
    	end

    	else begin
        	case (opcode)
            		NON   : out <= 4'b0 ;
            		ADD    : out <= add_out ;
            		SUB     : out <= sub_out ;
            		default : out <= 4'bx ;
        	endcase
    	end
end
endmodule
