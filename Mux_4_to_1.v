// Module
module Mux_4_to_1_Jiyun (i0, i1, i2, i3, s1, s0, out);
input		[1:0] i0, i1, i2, i3;
input	 	s1, s0;
output reg [1:0] out;

always @(*) begin
 case ({s1, s0})
  2'b00   : out <= i0;
  2'b01   : out <= i1;
  2'b10   : out <= i2;
  2'b11   : out <= i3;
  default : out <= 1'bx;
 endcase
end

endmodule

// Testbench
`timescale 1ns/100ps
module Mux_4_to_1_tb_Jiyun;
reg  [1:0] i0, i1, i2, i3;
reg  s1, s0;
wire [1:0] out;

Mux_4_to_1_Jiyun MUX (.i0(i0), .i1(i1), .i2(i2), .i3(i3), .s1(s1), .s0(s0), .out(out));

initial begin
 #10 i0 = 2'b00; i1 = 2'b01; i2 = 2'b10; i3 = 2'b11;
 #10 s1 = 1'b0; s0 = 1'b0;
 #10 s1 = 1'b0; s0 = 1'b1;
 #10 s1 = 1'b1; s0 = 1'b0;
 #10 s1 = 1'b1; s0 = 1'b1;
 #10 $finish;
end

endmodule
