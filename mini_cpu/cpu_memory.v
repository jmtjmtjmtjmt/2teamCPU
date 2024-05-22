module cpu_memory(
	input wire	[7:0]  ADDRESS,
	input	wire	[15:0] MAR,
	input	wire	[15:0] IN_ADDRESS_MEMORY,
  output wire	[15:0] OUT_ADDRESS_MEMORY,
	output wire	[15:0] OUT_MEMORY
);

reg [15:0] mem [0:255];	//2^8-1
reg [15:0] o_mem;
reg [15:0] oa_mem;

assign OUT_MEMORY = o_mem;
assign OUT_ADDRESS_MEMORY = oa_mem;

always @(MAR) begin
	o_mem <= mem[MAR];
end

always @(ADDRESS) begin
	oa_mem <= mem[ADDRESS];
end

always @(IN_ADDRESS_MEMORY) begin
	mem[ADDRESS] <= IN_ADDRESS_MEMORY;
end

initial begin
	// number
	mem[0] = 16'b0000_0000_0000_0000;	  // start memory
	mem[1] = 16'b0000_0000_0000_0001;	  // 1
	mem[2] = 16'b0000_0000_0000_0010;   // 2
	mem[3] = 16'b0000_0000_1000_0000;	  // 128
	mem[4] = 16'b0000_0000_0100_0000;	  // 64
	mem[5] = 16'b0000_0000_0000_1100;	  // 12
	mem[6] = 16'b0000_1100_0000_0000;	  // 3072

	// result memory
	mem[7] = 16'b0000_0000_0000_0000;	  // 1 + 2 = 3
	mem[8] = 16'b0000_0000_0000_0000;	  // 128 - 64 = 64
	mem[9] = 16'b0000_0000_0000_0000;	  // 12 * 2 = 24
	mem[10] = 16'b0000_0000_0000_0000;  // 3072 / 2 = 1536

	// instruction
	mem[100] = 16'b0001_0000_0000_0001;	// ar = 1
	mem[101] = 16'b0001_0001_0000_0010;	// result = 1 + 2 = 3
	mem[102] = 16'b0001_1111_0000_0111;	// mem[7] = 3
	mem[103] = 16'b0001_0000_0000_0011;	// ar = 128
	mem[104] = 16'b0001_0010_0000_0100;	// result = 128 - 64 = 64
	mem[105] = 16'b0001_1111_0000_1000; // mem[8] = 64
	mem[106] = 16'b0001_0000_0000_0101; // ar = 12
	mem[107] = 16'b0001_0011_0000_0101; // result = 24
	mem[108] = 16'b0001_1111_0000_1001; // mem[9] = 24
	mem[109] = 16'b0001_0000_0000_0110; // ar = 3072
	mem[110] = 16'b0001_0100_0000_0110; // result = 1036
	mem[111] = 16'b0001_1111_0000_1010; // mem[10] = 1036
end

endmodule
