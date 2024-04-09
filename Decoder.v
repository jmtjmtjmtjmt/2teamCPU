# Module
module Decoder_Jiyun(A, Y);
input         [1:0] A;
output reg  [3:0] Y;

always @(*) 
begin
 if       (A == 2'b00) Y = 4'b0001;
 else if (A == 2'b01) Y = 4'b0010;
 else if (A == 2'b10) Y = 4'b0100;
 else if (A == 2'b11) Y = 4'b1000;
 else 		            Y = 4'b0;
end
endmodule

// Testbench
`timescale 1ns/100ps
module Decoder_tb_Jiyun;
reg  [1:0] A;
wire [3:0] Y;

Decoder_Jiyun Decoder (.A(A), .Y(Y));

initial begin
 A = 2'b00;
 #10 A <= 2'b00;
 #10 A <= 2'b01;
 #10 A <= 2'b10;
 #10 A <= 2'b11;
 #10 $finish;
end
endmodule
