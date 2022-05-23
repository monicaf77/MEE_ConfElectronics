`timescale 1ns / 1ps

module axi_adder #(parameter WIDTH=4)(
	input [WIDTH-1:0] a,
	input [WIDTH-1:0] b,
    output [WIDTH:0] c
	);
	
assign c = a + b;

endmodule