`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - SignExtension.v
// Description - Sign extension module.
////////////////////////////////////////////////////////////////////////////////
module SignExtension(
	input [15:0]in, 
	output reg [31:0] out);
    
    initial begin
        out <= 0;
    end
    
    always@(*)begin
        out <= {{16{in[15]}}, in};
	end
		
endmodule
