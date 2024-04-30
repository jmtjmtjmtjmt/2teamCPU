`timescale 1ns/100ps

module cpu_main_tb;

reg  clk;
reg  rst;
reg  [15:0] memory;
wire [3:0] out;

cpu_main cpu_main_inst (
    	.clk(clk),
    	.rst(rst),
    	.memory(memory),
    	.out(out)
);

initial begin
   	  clk = 0;
    	rst = 0;
	    memory = 0;
	    #10 rst = 1;

	// ADD
    	#20;
    	memory = {4'b0001, 4'b0100, 4'b0010, 4'b0000}; // Opcode: ADD, Input_A: 4, Input_B: 2
    	#10;
    	memory = {4'b0000, 4'b0000, 4'b0000, 4'b0000}; // No operation

	// SUB
    	#20;
    	memory = {4'b0010, 4'b0100, 4'b0010, 4'b0000}; // Opcode: SUB, Input_A: 4, Input_B: 2
    	#10;
    	memory = {4'b0000, 4'b0000, 4'b0000, 4'b0000}; // No operation

	    #10 $finish;
end

always #5 clk = ~clk;

endmodule
