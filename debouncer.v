`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2026 03:09:35 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer(
    input raw,
    input clk,
    output reg clean
    );
    
    reg [25:0] counter;
    wire tc;
    
    always @ (posedge clk)
    begin
        if (~raw)
            counter <= 26'b0;
        else
            counter <= counter + 26'b1;
    end
    
    assign tc = (counter == 26'b11111111111111111111111111);
    
    always @(posedge clk)
        begin
            if (~raw)
                clean <= 1'b0;
            else if(tc)
                clean <=1'b1;
        end
endmodule
