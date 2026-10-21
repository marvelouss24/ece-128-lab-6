`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2026 03:09:35 PM
// Design Name: 
// Module Name: moore_4bit_sequence
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


module moore_4bit_sequence(
    input i,
    input clk,
    input rst,
    output reg c
    );
    
    parameter start = 3'b000,
              one_bit = 3'b001,
              two_bit = 3'b010,
              three_bit = 3'b011,
              four_bit = 3'b100;
    reg [2:0] present_state;
    reg [2:0] next_state;
    
    always @ (posedge clk or negedge rst) begin
            if (!rst)
                present_state <= start;
            else
                present_state <= next_state;
        end
    
    always @ (i or present_state) begin
            case (present_state)
                start : begin
                    c = 0;
                    if (i)
                        next_state = one_bit;
                    else
                        next_state = start;
                end
                one_bit : begin
                    c = 0;
                    if (i)
                        next_state = two_bit;
                    else
                        next_state = start;
                end
                two_bit : begin
                    c = 0;
                    if (i)
                        next_state = two_bit;
                    else
                        next_state = three_bit;
                end
                three_bit : begin
                    c = 0;
                    if (i)
                        next_state = one_bit;
                    else
                        next_state = four_bit;
                end
                four_bit : begin
                    c = 1;
                    if (i)
                        next_state = one_bit;
                    else
                        next_state = start;
                end
            endcase
    end
endmodule
