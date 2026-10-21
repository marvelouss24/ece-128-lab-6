`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2026 03:09:35 PM
// Design Name: 
// Module Name: debouncer_tb
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


module debouncer_tb;

reg raw;
reg clk;
wire clean;

debouncer uut(raw, clk, clean);

always #5 clk = ~clk;

initial begin
    clk = 1'b0; raw = 1'b0;
    
    #10 raw = 1'b1;
    
    #80 raw = 1'b0;
    
    #10 $stop;
    
end
endmodule
