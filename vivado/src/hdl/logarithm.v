`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2018 01:11:36 PM
// Design Name: 
// Module Name: logarithm
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


module logarithm #(
    parameter IN_BITS = 17,
    parameter OUT_BITS = 16
    ) (
    input clk,
    input [31:0] tdata_in,
    input tvalid_in,
    output [OUT_BITS-1:0] tdata_out,
    output tvalid_out
    );
    
    (* ram_style = "block" *) reg [OUT_BITS-1:0] ram [(2**IN_BITS)-1:0];
    initial $readmemh("log17.mem", ram);

    reg tvalid_out_r, tvalid_out_rr;
    reg [OUT_BITS-1:0] tdata_out_r, tdata_out_rr;
    
    always @(posedge clk) begin
        tvalid_out_r <= tvalid_in;
        tvalid_out_rr <= tvalid_out_r;
        tdata_out_rr <= tdata_out_r;
        if (tvalid_in) begin
            if (tdata_in[IN_BITS]) begin
                tdata_out_r <= 16'h8800;
            end
            else begin
                tdata_out_r <= ram[tdata_in[IN_BITS-1:0]];
            end
        end
    end
    
    assign tdata_out = tdata_out_rr;
    assign tvalid_out = tvalid_out_rr;
    
endmodule
