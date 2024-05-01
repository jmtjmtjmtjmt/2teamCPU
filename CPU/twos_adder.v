module twos_adder(x, y, c_in, sum, c_out);
	parameter N=4;
	input    [N-1:0] x, y;
	input    c_in;
	output   [N-1:0] sum;
	output   c_out;
	wire     [N-1:0] t;

	assign t = y ^ {N{c_in}};
	assign {c_out, sum} = x + t + c_in;
endmodule
