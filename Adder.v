// Main module
module twos_adder(x, y, c_in, sum, c_out);
	parameter N=4;
	input    [N-1:0] x, y;
	input    c_in;
	output   [N-1:0] sum;
	output   c_out;
	wire     [N-1:0] t;

  assign t = y ^ {N{c_in}};            // c_in이 0이면 Add, 1이면 Sub
  assign {c_out, sum} = x + t + c_in;  // c_out이 0이면 덧셈 결과, 1이면 뺄셈 결과 >> 덧셈에서1, 뺌셈에서0이 나오면 Overflow발생
endmodule


// Testbench
`timescale 1ns/100ps
module twos_adder_tb;
  parameter N = 4;
  reg [N-1:0] a, b;
  reg c_in;
  wire [N-1:0] sum;
  wire c_out;

  twos_adder Adder (.x(a), .y(b), .c_in(c_in), .sum(sum), .c_out(c_out));

  initial begin
    a = 0;  b = 0;  c_in = 0;
    #20 a = 1;  b = 0;
    #20 a = 3;  b = 0;
    #20 a = 5;  b = 5;
    #20 a = 7;  b = 3;
    #20 a = 9;  b = 6;
    #20 a = 11; b = 5;
    #20 a = 0;  b = 0;  c_in = 1;
    #20 a = 1;  b = 0;
    #20 a = 3;  b = 0;
    #20 a = 5;  b = 5;
    #20 a = 7;  b = 3;
    #20 a = 9;  b = 6;
    #20 a = 11; b = 12;
    #20 $finish;
  end
endmodule
