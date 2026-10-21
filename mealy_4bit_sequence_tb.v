`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2026 03:09:35 PM
// Design Name: 
// Module Name: mealy_4bit_sequence_tb
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


module mealy_4bit_sequence_tb;

reg i;
reg clk;
reg rst;
wire c;

mealy_4bit_sequence uut (i, clk, rst, c);

always #5 clk = ~clk;

initial begin
    clk = 1'b0; rst = 1'b0;
    
    #10 rst = 1'b1; i = 1'b0;
    #10 i = 1'b1;
    
    #10 i = 1'b0;
    #10 i = 1'b1;
    
    #30 i = 1'b0;
    #10 i = 1'b1;
    
    #20 i = 1'b0;
    #20 i = 1'b1;
    
    #10 i = 1'b0;
    #10 i = 1'b1;
    #10 rst = 1'b0;
    
    #10 $stop;
    
end
endmodule
