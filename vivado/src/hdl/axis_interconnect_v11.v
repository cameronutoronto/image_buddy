`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2018 12:17:15 PM
// Design Name: 
// Module Name: axis_interconnect
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

module axis_interconnect_v11(
    input p_ready,
    input [14:0] d_valid,
    input [31:0] data_in_00,
    input [31:0] data_in_01,
    input [31:0] data_in_02,
    input [31:0] data_in_03,
    input [31:0] data_in_04,
    input [31:0] data_in_05,
    input [31:0] data_in_06,
    input [31:0] data_in_07,
    input [31:0] data_in_08,
    input [31:0] data_in_09,
    input [31:0] data_in_10,
    input [31:0] data_in_11,
    input [31:0] data_in_12,
    input [31:0] data_in_13,
    input [31:0] data_in_14,
    input clk,
    output [31:0] data_out,
    output [14:0] i_ready,
    output d_valid_out
    );
    
reg[14:0] sel = 15'h0001; //log?
reg[31:0] data_in_r;
reg d_valid_out_r = 1'b0;
reg [1:0] state = 2'b00;
reg [14:0] i_ready_r;

always @(posedge clk) begin
    case (sel)
        15'h0001: data_in_r <= data_in_00;
        15'h0002: data_in_r <= data_in_01;
        15'h0004: data_in_r <= data_in_02;
        15'h0008: data_in_r <= data_in_03;
        15'h0010: data_in_r <= data_in_04;
        15'h0020: data_in_r <= data_in_05;
        15'h0040: data_in_r <= data_in_06;
        15'h0080: data_in_r <= data_in_07;
        15'h0100: data_in_r <= data_in_08;
        15'h0200: data_in_r <= data_in_09;
        15'h0400: data_in_r <= data_in_10;
        15'h0800: data_in_r <= data_in_11;
        15'h1000: data_in_r <= data_in_12;
        15'h2000: data_in_r <= data_in_13;
        15'h4000: data_in_r <= data_in_14;
        default: data_in_r <= data_in_r;
    endcase
    d_valid_out_r <= 1'b0;
    i_ready_r <= 15'h0000;
    case (state)
    2'b00: begin
        if (p_ready == 1'b1) begin
            i_ready_r <= sel;
            if ((d_valid & sel)) begin
                d_valid_out_r <= 1'b1;
                if (sel == 15'h4000)
                    sel <= 15'h0001;
                else
                    sel <= sel << 1;
                state <= 2'b01;
            end
        end
    end
    2'b01:
        state <= 2'b10;
    2'b10:
        state <= 2'b11;
    2'b11:
        state <= 2'b00;
    endcase
end

assign data_out = data_in_r;
assign i_ready = i_ready_r; //ready if processor is ready
assign d_valid_out = d_valid_out_r;

endmodule
