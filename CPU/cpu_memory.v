module cpu_memory(
	input      clk,
	input      rst,
  input      [15:0] memory,  // 16bit Menory
  output reg [3:0]  opcode,  // 처음 4bit opcode
  output reg [3:0]  input_A, // 다음 4bit input_A
  output reg [3:0]  input_B  // 다음 4bit input_B
);

always @(posedge clk, negedge rst) begin
  if (!rst) begin             // Memory Reset
		opcode  <= 4'b0;
		input_A <= 4'b0;
		input_B <= 4'b0;
	end

	else begin                  // Memory에 각 이름 할당
		opcode  <= memory[15:12];
		input_A <= memory[11:8];
		input_B <= memory[7:4];
	end
end

endmodule
