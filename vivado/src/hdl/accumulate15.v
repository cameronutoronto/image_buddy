`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2018 04:38:35 PM
// Design Name: 
// Module Name: accumulate15
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


module accumulate15(
    input clk,
    input mult_valid,
    input [31:0] mult_data,
    output [31:0] data_out,
    output valid_out
    );
    
    reg [3:0] counter = 4'h0;
    reg [31:0] sum = 32'h0;
    reg [31:0] sum_r;
    reg valid_out_r;
    
    always @(posedge clk) begin
        valid_out_r <= 1'b0;
        if (mult_valid) begin
            sum <= sum + mult_data;
            if (counter == 4'he) begin
                counter <= 4'h0;
                sum_r <= sum + mult_data;
                sum <= 32'h0;
                valid_out_r <= 1'b1;
            end
            else begin
                counter <= counter + 4'h1;
            end
        end
    end
    
    assign data_out = sum_r;
    assign valid_out = valid_out_r;
    
endmodule
