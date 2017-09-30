`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:02:20 09/26/2017 
// Design Name: 
// Module Name:    cicles_counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module cicles_counter(
	reset,
	enable,
	clk,
	cicles_count
    );

input reset;
input enable;
input clk;
output reg [7:0]cicles_count;

always@(negedge clk)
	begin
		if(enable != 0)
			cicles_count = cicles_count + 1; 
		if(reset == 1)
			cicles_count = 0;
	end

endmodule
