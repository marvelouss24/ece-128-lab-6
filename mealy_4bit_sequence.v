`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2026 03:09:35 PM
// Design Name: 
// Module Name: mealy_4bit_sequence
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


module mealy_4bit_sequence(
    input i,
    input clk,
    input rst,
    output reg c
    );
    
    parameter start = 2'b00,
              one_bit = 2'b01,
              two_bit = 2'b10,
              three_bit = 2'b11;
    reg [1:0] present_state;
    reg [1:0] next_state;
    
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
                    if (i) begin
                        next_state = one_bit;
                        c = 1;
                    end
                    else begin
                        next_state = start;
                        c = 0;
                    end
                end
            endcase
    end
endmodule

