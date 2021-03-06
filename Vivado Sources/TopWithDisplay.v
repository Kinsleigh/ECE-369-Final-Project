`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2017 11:05:57 AM
// Design Name: 
// Module Name: TopWithDisplay
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TopWithDisplay(Clk, Rst, out7, en_out);
	input Clk, Rst;
	output [6:0] out7;
	output [7:0] en_out;
	
	// ALL THE CORES
	wire [31:0] Core0_IF_PC_Out, Core0_WriteData, Core0_v0_out, Core0_v1_out, Core0_s4_out;
	TopModCore0 Core0(Clk, Rst, Core0_IF_PC_Out, Core0_WriteData, Core0_v0_out, Core0_v1_out, Core0_s4_out);
	
	wire [31:0] Core1_IF_PC_Out, Core1_WriteData, Core1_v0_out, Core1_v1_out, Core1_s4_out;
	TopModCore1 Core1(Clk, Rst, Core1_IF_PC_Out, Core1_WriteData, Core1_v0_out, Core1_v1_out, Core1_s4_out);
	
	wire [31:0] Core2_IF_PC_Out, Core2_WriteData, Core2_v0_out, Core2_v1_out, Core2_s4_out;
	TopModCore2 Core2(Clk, Rst, Core2_IF_PC_Out, Core2_WriteData, Core2_v0_out, Core2_v1_out, Core2_s4_out);

	wire [31:0] Core3_IF_PC_Out, Core3_WriteData, Core3_v0_out, Core3_v1_out, Core3_s4_out;
	TopModCore3 Core3(Clk, Rst, Core3_IF_PC_Out, Core3_WriteData, Core3_v0_out, Core3_v1_out, Core3_s4_out);
	
	wire [31:0] Core4_IF_PC_Out, Core4_WriteData, Core4_v0_out, Core4_v1_out, Core4_s4_out;
	TopModCore4 Core4(Clk, Rst, Core4_IF_PC_Out, Core4_WriteData, Core4_v0_out, Core4_v1_out, Core4_s4_out);	
	
	wire [31:0] Core5_IF_PC_Out, Core5_WriteData, Core5_v0_out, Core5_v1_out, Core5_s4_out;
	TopModCore5 Core5(Clk, Rst, Core5_IF_PC_Out, Core5_WriteData, Core5_v0_out, Core5_v1_out, Core5_s4_out);	
	
	wire [31:0] Core6_IF_PC_Out, Core6_WriteData, Core6_v0_out, Core6_v1_out, Core6_s4_out;
	TopModCore6 Core6(Clk, Rst, Core6_IF_PC_Out, Core6_WriteData, Core6_v0_out, Core6_v1_out, Core6_s4_out);	

	wire [31:0] Core7_IF_PC_Out, Core7_WriteData, Core7_v0_out, Core7_v1_out, Core7_s4_out;
	TopModCore7 Core7(Clk, Rst, Core7_IF_PC_Out, Core7_WriteData, Core7_v0_out, Core7_v1_out, Core7_s4_out);
	
	// ALL THE SADNESS
	wire [31:0] MinSADIn;
	wire [7:0] MinSADRowIn, MinSADColumnIn;
	wire [31:0] MinSADOut;
	wire [7:0] MinSADRowOut, MinSADColumnOut;
	SADRegister SADReg(Clk, Rst, MinSADIn, MinSADRowIn, MinSADColumnIn, MinSADOut, MinSADRowOut, MinSADColumnOut);
	
	// ROW OFFSET ADDERS
	
	wire [7:0] Core1RowOut, Core2RowOut, Core3RowOut, Core4RowOut, Core5RowOut, Core6RowOut, Core7RowOut;
	
	Adder8Bit RowOneAdder(Core1_v0_out[7:0], 8'd8, Core1RowOut);
	Adder8Bit RowTowAdder(Core2_v0_out[7:0], 8'd16, Core2RowOut);
	Adder8Bit RowThreeAdder(Core3_v0_out[7:0], 8'd24, Core3RowOut);
	Adder8Bit RowFourAdder(Core4_v0_out[7:0], 8'd32, Core4RowOut);
	Adder8Bit RowFiveAdder(Core5_v0_out[7:0], 8'd40, Core5RowOut);
	Adder8Bit RowSixAdder(Core6_v0_out[7:0], 8'd48, Core6RowOut);
	Adder8Bit RowSevenAdder(Core7_v0_out[7:0], 8'd56, Core7RowOut);
	
	// ALL THE COMPARATORS
	wire [31:0] C01Out, C23Out, C45Out, C67Out, C2nd1Out, C2nd2Out;
	wire [7:0] C01RowOut, C01ColOut, C23RowOut, C23ColOut, C45RowOut, C45ColOut, C67RowOut, C67ColOut, C2nd1RowOut, C2nd1ColOut, C2nd2RowOut, C2nd2ColOut;
	
	SADComparator Compare01(Core0_s4_out, Core0_v0_out[7:0], Core0_v1_out[7:0], Core1_s4_out, Core1RowOut, Core1_v1_out[7:0], C01Out, C01RowOut, C01ColOut);
	SADComparator Compare23(Core2_s4_out, Core2RowOut, Core2_v1_out[7:0], Core3_s4_out, Core3RowOut, Core3_v1_out[7:0], C23Out, C23RowOut, C23ColOut);
	SADComparator Compare45(Core4_s4_out, Core4RowOut, Core4_v1_out[7:0], Core5_s4_out, Core5RowOut, Core5_v1_out[7:0], C45Out, C45RowOut, C45ColOut);
	SADComparator Compare67(Core6_s4_out, Core6RowOut, Core6_v1_out[7:0], Core7_s4_out, Core7RowOut, Core7_v1_out[7:0], C67Out, C67RowOut, C67ColOut);
	
	SADComparator Compare2nd1(C01Out, C01RowOut, C01ColOut, C23Out, C23RowOut, C23ColOut, C2nd1Out, C2nd1RowOut, C2nd1ColOut);
	SADComparator Compare2nd2(C45Out, C45RowOut, C45ColOut, C67Out, C67RowOut, C67ColOut, C2nd2Out, C2nd2RowOut, C2nd2ColOut);
	
	SADComparator CompareFinal(C2nd1Out, C2nd1RowOut, C2nd1ColOut, C2nd2Out, C2nd2RowOut, C2nd2ColOut, MinSADIn, MinSADRowIn, MinSADColumnIn);
	
	// ALL THE DISPLAY
	Two4DigitDisplay XYDisp(Clk, MinSADRowOut[7:0], MinSADColumnOut[7:0], MinSADOut[7:0], out7, en_out);
    
endmodule
