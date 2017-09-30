`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:57:46 09/14/2017 
// Design Name: 
// Module Name:    Reloj 
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
module Reloj(
    input clk,
    output reg reloj_reducido
    );
reg [255:0]contador;

//si contador es menor a 10k suma 1, sino reset 0 y cambio en reloj_reducido
always @(posedge clk)
	begin 
	if(contador<200000)//medio segundo de cambio
		begin 
			contador = contador+1;
		end
	else begin 
			contador = 0;
			//reloj_reducido = (reloj_reducido==1)?0:1;
			if(reloj_reducido==1)reloj_reducido=0;else reloj_reducido=1;
		end
	end
endmodule
