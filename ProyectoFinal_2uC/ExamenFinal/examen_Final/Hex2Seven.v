`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:03:15 07/21/2017 
// Design Name: 
// Module Name:    Hex2Seven 
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
module Hex2Seven(
    input [7:0] entrada,
    output reg a,
	 output reg b,
	 output reg c,
	 output reg d,
	 output reg e,
	 output reg f,
	 output reg g
    );
	 
	 always @*
		case(entrada)
			8'b0000_0000: begin a=0;b=0;c=0;d=0;e=0;f=0;g=1; end
			8'b0000_0001: begin a=1;b=0;c=0;d=1;e=1;f=1;g=1; end
			8'b0000_0010: begin a=0;b=0;c=1;d=0;e=0;f=1;g=0; end
			8'b0000_0011: begin a=0;b=0;c=0;d=0;e=1;f=1;g=0; end
			8'b0000_0100: begin a=1;b=0;c=0;d=1;e=1;f=0;g=0; end
			8'b0000_0101: begin a=0;b=1;c=0;d=0;e=1;f=0;g=0; end
			8'b0000_0110: begin a=0;b=1;c=0;d=0;e=0;f=0;g=0; end
			8'b0000_0111: begin a=0;b=0;c=0;d=1;e=1;f=1;g=1; end
			8'b0000_1000: begin a=0;b=0;c=0;d=0;e=0;f=0;g=0; end
			8'b0000_1001: begin a=0;b=0;c=0;d=0;e=1;f=0;g=0; end
			8'b0000_1010: begin a=0;b=0;c=0;d=1;e=0;f=0;g=0; end
			8'b0000_1011: begin a=1;b=1;c=0;d=0;e=0;f=0;g=0; end
			8'b0000_1100: begin a=0;b=1;c=1;d=0;e=0;f=0;g=1; end
			8'b0000_1101: begin a=1;b=0;c=0;d=0;e=0;f=1;g=0; end
			8'b0000_1110: begin a=0;b=1;c=0;d=0;e=1;f=0;g=0; end
			8'b0000_1111: begin a=0;b=1;c=1;d=1;e=0;f=0;g=0; end
			default begin a=0;b=0;c=0;d=0;e=0;f=0;g=1; end
		endcase 


endmodule
