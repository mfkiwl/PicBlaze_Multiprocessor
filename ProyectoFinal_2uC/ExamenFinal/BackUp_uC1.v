////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2004 Xilinx, Inc.
// All Rights Reserved
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: 1.01
//  \   \         Filename: embedded_kcpsm3.v
//  /   /         Date Last Modified:  08/04/2004
// /___/   /\     Date Created: 06/03/2003
// \   \  /  \
//  \___\/\___\
//
//Device:  	Xilinx
//Purpose: 	
// 	This file instantiates the KCPSM3 processor macro and connects the 
//	program ROM.
//Reference:
// 	None
//Revision History:
//    Rev 1.00 - kc - Start of design entry in VHDL,  06/03/2003.
//    Rev 1.01 - sus - Converted to verilog,  08/04/2004.
////////////////////////////////////////////////////////////////////////////////
// NOTE: The name of the program ROM will probably need to be changed to 
//       reflect the name of the program (PSM) file applied to the assembler.
////////////////////////////////////////////////////////////////////////////////
// Contact: e-mail  picoblaze@xilinx.com
//////////////////////////////////////////////////////////////////////////////////
//
// Disclaimer: 
// LIMITED WARRANTY AND DISCLAIMER. These designs are
// provided to you "as is". Xilinx and its licensors make and you
// receive no warranties or conditions, express, implied,
// statutory or otherwise, and Xilinx specifically disclaims any
// implied warranties of merchantability, non-infringement, or
// fitness for a particular purpose. Xilinx does not warrant that
// the functions contained in these designs will meet your
// requirements, or that the operation of these designs will be
// uninterrupted or error free, or that defects in the Designs
// will be corrected. Furthermore, Xilinx does not warrant or
// make any representations regarding use or the results of the
// use of the designs in terms of correctness, accuracy,
// reliability, or otherwise.
//
// LIMITATION OF LIABILITY. In no event will Xilinx or its
// licensors be liable for any loss of data, lost profits, cost
// or procurement of substitute goods or services, or for any
// special, incidental, consequential, or indirect damages
// arising from the use or operation of the designs or
// accompanying documentation, however caused and on any theory
// of liability. This limitation will apply even if Xilinx
// has been advised of the possibility of such damage. This
// limitation shall apply not-withstanding the failure of the 
// essential purpose of any limited remedies herein. 
//////////////////////////////////////////////////////////////////////////////////
module embedded_kcpsm3(
	port_id,
	write_strobe,
	read_strobe,
	in_port_switches,
	interrupt,
	interrupt_ack,
	reset,
	clk,
	leds_result,
	anodo,
	sw1
	);

// Outputs
output[7:0] port_id; 
output 	write_strobe;
output 	read_strobe;
output 	interrupt_ack;
output reg [7:0]leds_result; 	// Puerto de salida conectado a los leds.
output anodo;						// Anodo para los Display.

// Inputs
input[7:0] 	in_port_switches; // Puerto de entrada con los valores de los swiches.
input interrupt;
input reset;	// Reset del uC, conectado a BTN3.
input clk;		// Clk real del FPG. 
input sw1;		// Entrada conectada a SW0.

// Wires (Conexiones)
wire  [7:0] port_id; 	// id del puerto donde escribimos.
wire   	write_strobe; 	// indica que vamos a escribir desde el uC.
wire   	read_strobe; 	// indica que el uC va a leer del puerto.
wire  [7:0] out_port;
wire  [7:0] in_port;
wire   	interrupt;
wire   	interrupt_ack;
wire   	reset;
wire   	clk;
wire [9:0] 	address;
wire [17:0] instruction;
wire reloj_reducido;
wire [15:0] cicles_count;


reg [7:0] array_address;
reg [15:0] cicles_register; // Registro que guarda la cantidad de ciclos del procesador.
reg [7:0] result;
reg [7:0] program_enable;


assign anodo = 1;

always@(posedge read_strobe)
	begin
		array_address = array_address + 1;
	end

always@(negedge write_strobe)
	begin
		if(port_id == 1)
			result = out_port;
		if(port_id == 2) begin
			program_enable = out_port;
			cicles_register = cicles_count;
			end
	end
	
always@(*)
	begin
		if(sw1 == 0)
			leds_result = result;
		if(sw1 == 1)
			leds_result = cicles_register[15:8];
	end
//----------------------------------------------------------------------------------
//
// declaration of KCPSM3
//
//
// declaration of program ROM
//
//----------------------------------------------------------------------------------
//
// Start of test circuit description
//

  	kcpsm3 processor
	(	.address(address),
    	.instruction(instruction),
		.port_id(port_id),
    	.write_strobe(write_strobe),
		.out_port(out_port),
    	.read_strobe(read_strobe),
    	.in_port(in_port),
    	.interrupt(interrupt),
    	.interrupt_ack(interrupt_ack),
    	.reset(reset),
    	.clk(reloj_reducido)
	);

  	prog_rom program
 	(	.address(address),
    	.instruction(instruction),
    	.clk(reloj_reducido)
	);
			
	array_rom array
	(	.address(array_address),
		.data(in_port),
		.clk(read_strobe)
	);
	
	cicles_counter counter
	(  .reset(reset),
		.enable(program_enable),
		.clk(reloj_reducido),
		.cicles_count(cicles_count)
	);
	
	Reloj relojito
	(  .clk(clk),
		.reloj_reducido(reloj_reducido)
	);
	
endmodule

//----------------------------------------------------------------------------------
//
// END OF FILE EMBEDDED_KCPSM3.V
//
//----------------------------------------------------------------------------------


