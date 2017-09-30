`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:58 09/26/2017 
// Design Name: 
// Module Name:    array_rom 
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
module array_rom(
    address,
	 address2,
	 data,
	 data2,
	 clk,
	 clk2
	 );
	 
	 input [7:0] address;
	 input [7:0] address2;
	 input clk;
	 input clk2;
	 output reg [7:0] data;
	 output reg [7:0] data2;
	 
	 reg [7:0] memory [199:0]; 
	 initial begin 
	 memory[0] = 0;
	 memory[1] = 1;
	 memory[2] = 2;
	 memory[3] = 3; // 1
	 memory[4] = 4;
	 memory[5] = 5;
	 memory[6] = 6;
	 memory[7] = 7;
	 memory[8] = 8;
	 memory[9] = 9;
	 memory[10] = 3; // 2
	 memory[11] = 11;
	 memory[12] = 12;
	 memory[13] = 13;
	 memory[14] = 14;
	 memory[15] = 15;
	 memory[16] = 16;
	 memory[17] = 17;
	 memory[18] = 18;
	 memory[19] = 19;
	 memory[20] = 3; // 3
	 memory[21] = 21;
	 memory[22] = 22;
	 memory[23] = 23;
	 memory[24] = 24;
	 memory[25] = 25;
	 memory[26] = 26;
	 memory[27] = 27;
	 memory[28] = 28;
	 memory[29] = 29;
	 memory[30] = 3; // 4
	 memory[31] = 31;
	 memory[32] = 32;
	 memory[33] = 33;
	 memory[34] = 34;
	 memory[35] = 35;
	 memory[36] = 36;
	 memory[37] = 37;
	 memory[38] = 38;
	 memory[39] = 39;
	 memory[40] = 3; // 5
	 memory[41] = 41;
	 memory[42] = 42;
	 memory[43] = 43;
	 memory[44] = 44;
	 memory[45] = 45;
	 memory[46] = 46;
	 memory[47] = 47;
	 memory[48] = 48;
	 memory[49] = 49;
	 memory[50] = 3; // 6
	 memory[51] = 51;
	 memory[52] = 52;
	 memory[53] = 53;
	 memory[54] = 54;
	 memory[55] = 55;
	 memory[56] = 56;
	 memory[57] = 57;
	 memory[58] = 58;
	 memory[59] = 59;
	 memory[60] = 60;
	 memory[61] = 61;
	 memory[62] = 62;
	 memory[63] = 63;
	 memory[64] = 64;
	 memory[65] = 65;
	 memory[66] = 66;
	 memory[67] = 67;
	 memory[68] = 68;
	 memory[69] = 69;
	 memory[70] = 70;
	 memory[71] = 71;
	 memory[72] = 72;
	 memory[73] = 73;
	 memory[74] = 74;
	 memory[75] = 75;
	 memory[76] = 76;
	 memory[77] = 77;
	 memory[78] = 78;
	 memory[79] = 79;
	 memory[80] = 80;
	 memory[81] = 81;
	 memory[82] = 82;
	 memory[83] = 83;
	 memory[84] = 84;
	 memory[85] = 85;
	 memory[86] = 86;
	 memory[87] = 87;
	 memory[88] = 88;
	 memory[89] = 89;
	 memory[90] = 3; // 7
	 memory[91] = 91;
	 memory[92] = 92;
	 memory[93] = 93;
	 memory[94] = 94;
	 memory[95] = 95;
	 memory[96] = 96;
	 memory[97] = 97;
	 memory[98] = 98;
	 memory[99] = 99;
	 memory[100] = 100;
	 memory[101] = 101;
	 memory[102] = 102;
	 memory[103] = 103;
	 memory[104] = 104;
	 memory[105] = 105;
	 memory[106] = 106;
	 memory[107] = 107;
	 memory[108] = 108;
	 memory[109] = 109;
	 memory[110] = 3; // 8
	 memory[111] = 111;
	 memory[112] = 112;
	 memory[113] = 113;
	 memory[114] = 114;
	 memory[115] = 115;
	 memory[116] = 116;
	 memory[117] = 117;
	 memory[118] = 118;
	 memory[119] = 119;
	 memory[120] = 3; // 9
	 memory[121] = 121;
	 memory[122] = 122;
	 memory[123] = 123;
	 memory[124] = 124;
	 memory[125] = 125;
	 memory[126] = 126;
	 memory[127] = 127;
	 memory[128] = 128;
	 memory[129] = 129;
	 memory[130] = 3; // 10
	 memory[131] = 131;
	 memory[132] = 132;
	 memory[133] = 133;
	 memory[134] = 134;
	 memory[135] = 135;
	 memory[136] = 136;
	 memory[137] = 137;
	 memory[138] = 138;
	 memory[139] = 139;
	 memory[140] = 3; // 11
	 memory[141] = 141;
	 memory[142] = 142;
	 memory[143] = 143;
	 memory[144] = 144;
	 memory[145] = 145;
	 memory[146] = 146;
	 memory[147] = 147;
	 memory[148] = 148;
	 memory[149] = 149;
	 memory[150] = 150; // 12
	 memory[151] = 151;
	 memory[152] = 152;
	 memory[153] = 153;
	 memory[154] = 154;
	 memory[155] = 155;
	 memory[156] = 156;
	 memory[157] = 157;
	 memory[158] = 158;
	 memory[159] = 159;
	 memory[160] = 160;
	 memory[161] = 161;
	 memory[162] = 162;
	 memory[163] = 163;
	 memory[164] = 164;
	 memory[165] = 165;
	 memory[166] = 166;
	 memory[167] = 167;
	 memory[168] = 168;
	 memory[169] = 169;
	 memory[170] = 170;
	 memory[171] = 171;
	 memory[172] = 172;
	 memory[173] = 173;
	 memory[174] = 174;
	 memory[175] = 175;
	 memory[176] = 176;
	 memory[177] = 177;
	 memory[178] = 178;
	 memory[179] = 179;
	 memory[180] = 3; // 13
	 memory[181] = 3; // 14 
	 memory[182] = 3; // 14
	 memory[183] = 183;
	 memory[184] = 184;
	 memory[185] = 185;
	 memory[186] = 186;
	 memory[187] = 187;
	 memory[188] = 188;
	 memory[189] = 189;
	 memory[190] = 190;
	 memory[191] = 191;
	 memory[192] = 192;
	 memory[193] = 193;
	 memory[194] = 194;
	 memory[195] = 195;
	 memory[196] = 196;
	 memory[197] = 197;
	 memory[198] = 198;
	 memory[199] = 199;
	 end
	 
	 always@(clk)
		begin
			data = memory[address];
		end
	always@(clk2)
		begin
			data2 = memory[address2 + 100];
		end
endmodule
