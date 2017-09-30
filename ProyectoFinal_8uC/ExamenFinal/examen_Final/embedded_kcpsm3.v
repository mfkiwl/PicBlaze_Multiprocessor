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
	in_port_switches,
	reset,
	clk,
	leds_result,
	anodo,
	sw1,
	sw2
	);

// Outputs
output reg [7:0]leds_result; 	// Puerto de salida conectado a los leds.
output anodo;						// Anodo para los Display.

// Inputs
input[7:0] 	in_port_switches; // Puerto de entrada con los valores de los swiches.
input reset;	// Reset del uC, conectado a BTN3.
input clk;		// Clk real del FPG. 
input sw1;		// Entrada conectada a SW0.
input sw2;		// Entrada conectada a SW1.

// Wires (Conexiones)
wire  [7:0] port_id; 	// id del puerto donde escribimos.
wire  [7:0] port_id2; 	// id del puerto donde escribimos.
wire  [7:0] port_id3; 	// id del puerto donde escribimos.
wire  [7:0] port_id4; 	// id del puerto donde escribimos.
wire  [7:0] port_id5; 	// id del puerto donde escribimos.
wire  [7:0] port_id6; 	// id del puerto donde escribimos.
wire  [7:0] port_id7; 	// id del puerto donde escribimos.
wire  [7:0] port_id8; 	// id del puerto donde escribimos.
wire   	write_strobe; 	// indica que vamos a escribir desde el uC.
wire   	write_strobe2; 	// indica que vamos a escribir desde el uC.
wire   	write_strobe3; 	// indica que vamos a escribir desde el uC.
wire   	write_strobe4; 	// indica que vamos a escribir desde el uC.
wire   	write_strobe5; 	// indica que vamos a escribir desde el uC.
wire   	write_strobe6; 	// indica que vamos a escribir desde el uC.
wire   	write_strobe7; 	// indica que vamos a escribir desde el uC.
wire   	write_strobe8; 	// indica que vamos a escribir desde el uC.
wire   	read_strobe; 	// indica que el uC va a leer del puerto.
wire   	read_strobe2; 	// indica que el uC va a leer del puerto.
wire   	read_strobe3; 	// indica que el uC va a leer del puerto.
wire   	read_strobe4; 	// indica que el uC va a leer del puerto.
wire   	read_strobe5; 	// indica que el uC va a leer del puerto.
wire   	read_strobe6; 	// indica que el uC va a leer del puerto.
wire   	read_strobe7; 	// indica que el uC va a leer del puerto.
wire   	read_strobe8; 	// indica que el uC va a leer del puerto.
wire  [7:0] out_port;
wire  [7:0] out_port2;
wire  [7:0] out_port3;
wire  [7:0] out_port4;
wire  [7:0] out_port5;
wire  [7:0] out_port6;
wire  [7:0] out_port7;
wire  [7:0] out_port8;
wire  [7:0] in_port;
wire  [7:0] in_port2;
wire  [7:0] in_port3;
wire  [7:0] in_port4;
wire  [7:0] in_port5;
wire  [7:0] in_port6;
wire  [7:0] in_port7;
wire  [7:0] in_port8;
wire   	interrupt;
wire   	interrupt_ack;
wire   	interrupt2;
wire   	interrupt_ack2;
wire   	interrupt3;
wire   	interrupt_ack3;
wire   	interrupt4;
wire   	interrupt_ack4;
wire   	interrupt5;
wire   	interrupt_ack5;
wire   	interrupt6;
wire   	interrupt_ack6;
wire   	interrupt7;
wire   	interrupt_ack7;
wire   	interrupt8;
wire   	interrupt_ack8;
wire   	reset;
wire   	clk;

wire [9:0] 	address;
wire [17:0] instruction;
wire [9:0] 	address2;
wire [17:0] instruction2;
wire [9:0] 	address3;
wire [17:0] instruction3;
wire [9:0] 	address4;
wire [17:0] instruction4;
wire [9:0] 	address5;
wire [17:0] instruction5;
wire [9:0]  address6;
wire [17:0] instruction6;
wire [9:0] 	address7;
wire [17:0] instruction7;
wire [9:0] 	address8;
wire [17:0] instruction8;
wire reloj_reducido;
wire [15:0] cicles_count;

reg [7:0] array_address;
reg [7:0] array_address2;
reg [7:0] array_address3;
reg [7:0] array_address4;
reg [7:0] array_address5;
reg [7:0] array_address6;
reg [7:0] array_address7;
reg [7:0] array_address8;
reg [15:0] cicles_register; // Registro que guarda la cantidad de ciclos del procesador.
reg [7:0] result;
reg [7:0] result2;
reg [7:0] result3;
reg [7:0] result4;
reg [7:0] result5;
reg [7:0] result6;
reg [7:0] result7;
reg [7:0] result8;
reg [7:0] program_enable;
reg [7:0] program_enable2;
reg [7:0] program_enable3;
reg [7:0] program_enable4;
reg [7:0] program_enable5;
reg [7:0] program_enable6;
reg [7:0] program_enable7;
reg [7:0] program_enable8;
reg [7:0] program_enable_master;


assign anodo = 1;

always@(posedge read_strobe)
	begin
		array_address = array_address + 1;
	end
always@(posedge read_strobe2)
	begin
		array_address2 = array_address2 + 1;
	end
always@(posedge read_strobe3)
	begin
		array_address3 = array_address3 + 1;
	end
always@(posedge read_strobe4)
	begin
		array_address4 = array_address4 + 1;
	end
always@(posedge read_strobe5)
	begin
		array_address5 = array_address5 + 1;
	end
always@(posedge read_strobe6)
	begin
		array_address6 = array_address6 + 1;
	end
always@(posedge read_strobe7)
	begin
		array_address7 = array_address7 + 1;
	end
always@(posedge read_strobe8)
	begin
		array_address8 = array_address8 + 1;
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

always@(negedge write_strobe2)
	begin
		if(port_id2 == 1)
			result2 = out_port2;
		if(port_id2 == 2) begin
			program_enable2 = out_port2;
			end
	end

always@(negedge write_strobe3)
	begin
		if(port_id3 == 1)
			result3 = out_port3;
		if(port_id3 == 2) begin
			program_enable3 = out_port3;
			end
	end

always@(negedge write_strobe4)
	begin
		if(port_id4 == 1)
			result4 = out_port4;
		if(port_id4 == 2) begin
			program_enable4 = out_port4;
			end
	end
	
always@(negedge write_strobe5)
	begin
		if(port_id5 == 1)
			result5 = out_port5;
		if(port_id5 == 2) begin
			program_enable5 = out_port5;
			end
	end

always@(negedge write_strobe6)
	begin
		if(port_id6 == 1)
			result6 = out_port6;
		if(port_id6 == 2) begin
			program_enable6 = out_port6;
			end
	end

always@(negedge write_strobe7)
	begin
		if(port_id7 == 1)
			result7 = out_port7;
		if(port_id7 == 2) begin
			program_enable7 = out_port7;
			end
	end
	always@(negedge write_strobe8)
	begin
		if(port_id8 == 1)
			result8 = out_port8;
		if(port_id8 == 2) begin
			program_enable8 = out_port8;
			end
	end
	
always@(*)
	begin	
		if(sw1 == 0)
			leds_result = result + result2 + result3 + result4 + result5 + result6 + result7 + result8;
		if(sw1 == 1)
			leds_result = cicles_register[7:0];
		if(sw2 == 1)
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
	
	kcpsm3 processor2
	(	.address(address2),
    	.instruction(instruction2),
		.port_id(port_id2),
    	.write_strobe(write_strobe2),
		.out_port(out_port2),
    	.read_strobe(read_strobe2),
    	.in_port(in_port2),
    	.interrupt(interrupt2),
    	.interrupt_ack(interrupt_ack2),
    	.reset(reset),
    	.clk(reloj_reducido)
	);
	
	kcpsm3 processor3
	(	.address(address3),
    	.instruction(instruction3),
		.port_id(port_id3),
    	.write_strobe(write_strobe3),
		.out_port(out_port3),
    	.read_strobe(read_strobe3),
    	.in_port(in_port3),
    	.interrupt(interrupt3),
    	.interrupt_ack(interrupt_ack3),
    	.reset(reset),
    	.clk(reloj_reducido)
	);
	
	kcpsm3 processor4
	(	.address(address4),
    	.instruction(instruction4),
		.port_id(port_id4),
    	.write_strobe(write_strobe4),
		.out_port(out_port4),
    	.read_strobe(read_strobe4),
    	.in_port(in_port4),
    	.interrupt(interrupt4),
    	.interrupt_ack(interrupt_ack4),
    	.reset(reset),
    	.clk(reloj_reducido)
	);
	
	kcpsm3 processor5
	(	.address(address5),
    	.instruction(instruction5),
		.port_id(port_id5),
    	.write_strobe(write_strobe5),
		.out_port(out_port5),
    	.read_strobe(read_strobe5),
    	.in_port(in_port5),
    	.interrupt(interrupt5),
    	.interrupt_ack(interrupt_ack5),
    	.reset(reset),
    	.clk(reloj_reducido)
	);
	
	kcpsm3 processor6
	(	.address(address6),
    	.instruction(instruction6),
		.port_id(port_id6),
    	.write_strobe(write_strobe6),
		.out_port(out_port6),
    	.read_strobe(read_strobe6),
    	.in_port(in_port6),
    	.interrupt(interrupt6),
    	.interrupt_ack(interrupt_ack6),
    	.reset(reset),
    	.clk(reloj_reducido)
	);
	
	kcpsm3 processor7
	(	.address(address7),
    	.instruction(instruction7),
		.port_id(port_id7),
    	.write_strobe(write_strobe7),
		.out_port(out_port7),
    	.read_strobe(read_strobe7),
    	.in_port(in_port7),
    	.interrupt(interrupt7),
    	.interrupt_ack(interrupt_ack7),
    	.reset(reset),
    	.clk(reloj_reducido)
	);
	
	kcpsm3 processor8
	(	.address(address8),
    	.instruction(instruction8),
		.port_id(port_id8),
    	.write_strobe(write_strobe8),
		.out_port(out_port8),
    	.read_strobe(read_strobe8),
    	.in_port(in_port8),
    	.interrupt(interrupt8),
    	.interrupt_ack(interrupt_ack8),
    	.reset(reset),
    	.clk(reloj_reducido)
	);

  	prog_rom program
 	(	.address(address),
    	.instruction(instruction),
    	.clk(reloj_reducido)
	);
	
	prog_rom program2
 	(	.address(address2),
    	.instruction(instruction2),
    	.clk(reloj_reducido)
	);
	
	prog_rom program3
 	(	.address(address3),
    	.instruction(instruction3),
    	.clk(reloj_reducido)
	);
	
	prog_rom program4
 	(	.address(address4),
    	.instruction(instruction4),
    	.clk(reloj_reducido)
	);
	
	prog_rom program5
 	(	.address(address5),
    	.instruction(instruction5),
    	.clk(reloj_reducido)
	);
	
	prog_rom program6
 	(	.address(address6),
    	.instruction(instruction6),
    	.clk(reloj_reducido)
	);
	
	prog_rom program7
 	(	.address(address7),
    	.instruction(instruction7),
    	.clk(reloj_reducido)
	);
	
	prog_rom program8
 	(	.address(address8),
    	.instruction(instruction8),
    	.clk(reloj_reducido)
	);
			
	array_rom array
	(	.address(array_address),
		.address2(array_address2),
		.address3(array_address3),
		.address4(array_address4),
		.address5(array_address5),
		.address6(array_address6),
		.address7(array_address7),
		.address8(array_address8),
		.data(in_port),
		.data2(in_port2),
		.data3(in_port3),
		.data4(in_port4),
		.data5(in_port5),
		.data6(in_port6),
		.data7(in_port7),
		.data8(in_port8),
		.clk(read_strobe),
		.clk2(read_strobe2),
		.clk3(read_strobe3),
		.clk4(read_strobe4),
		.clk5(read_strobe5),
		.clk6(read_strobe6),
		.clk7(read_strobe7),
		.clk8(read_strobe8)
	);
	
	cicles_counter counter
	(  .reset(reset),
		.enable(program_enable2),
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


