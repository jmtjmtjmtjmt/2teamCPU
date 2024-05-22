module execute (
	input	wire	CLK,
	input	wire	RST_N,
	input wire 	START,
	input	wire	[1:0]	IDEN,
	input wire	[3:0]  	OPCODE,
	input	wire	[15:0] OUT_ADDRESS_MEMORY,	// input mem[ADDRESS]
	output wire	[15:0] IN_ADDRESS_MEMORY,	  // output mem[ADDRESS]
	output wire	[15:0] RESULT
);

reg [15:0] ia_mem;
reg [15:0] result;
reg [15:0] ar;	// Arithmetic Register : 누산기

assign IN_ADDRESS_MEMORY = ia_mem;
assign RESULT = result;

always @(posedge CLK, negedge RST_N) begin
	if (!RST_N) begin
		ia_mem <= 16'b0;
		ar 	<= 0;
		result <= 0;
	end

	else begin
		if (START) begin
			if (IDEN == 2'b01) begin
				case (OPCODE)
					4'b0000 : ar <= OUT_ADDRESS_MEMORY;
					4'b0001 : result <= ar + OUT_ADDRESS_MEMORY;
					4'b0010 : result <= ar  - OUT_ADDRESS_MEMORY;
					4'b0011 : result <= ar << 1;
					4'b0100 : result <= ar >> 1;
					4'b1111 : ia_mem <= result;
					default : result <= 0;
				endcase
			end

			else begin
				result <= OUT_ADDRESS_MEMORY;
			end
		end

		else begin
			result <= result;
		end
	end
end

endmodule
