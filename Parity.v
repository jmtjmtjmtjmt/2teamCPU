module Parity_Jiyun(a, b, c, P);

input   a, b, c;
output P;
reg     P;

 always @(*) begin
 assign P = (!a&!b&c) || (!a&b&!c) || (a&!b&!c) || (a&b&c);
end

endmodule


`timescale 1ns/100ps;
module Parity_tb_Jiyun;

reg  a, b, c;
wire P;

Parity_Jiyun Parity (.a(a), .b(b), .c(c), .P(P));

initial begin
 #10 a=0; b=0; c=0;
 #10 a=0; b=0; c=1;
 #10 a=0; b=1; c=0;
 #10 a=0; b=1; c=1;
 #10 a=1; b=0; c=0;
 #10 a=1; b=0; c=1;
 #10 a=1; b=1; c=0;
 #10 a=1; b=1; c=1;
 #10
 $finish;
end

endmodule
