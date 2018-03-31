`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2018 04:42:46 PM
// Design Name: 
// Module Name: delay_reg
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


module delay_reg(
    input clk,
    input [7:0] tuser_in,
    output reg [7:0] tuser_out,
    input tvalid_in,
    output reg tvalid_out,
    input tlast_in,
    output reg tlast_out
    );
    
    always @(posedge clk) begin
        tuser_out <= tuser_in;
        tvalid_out <= tvalid_in;
        tlast_out <= tlast_in;
    end
endmodule
