`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2018 02:45:12 PM
// Design Name: 
// Module Name: get_values
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


module get_values(
    input clk,
    input [15:0] tdata_in,
    input tvalid_in,
    output tready_out,
    
    //input tready_in, // ignore this
    output [15:0] data_to_mult_a,
    output [11:0] data_to_mult_b0,
    output [11:0] data_to_mult_b1,
    output [11:0] data_to_mult_b2,
    output [11:0] data_to_mult_b3,
    output [11:0] data_to_mult_b4,
    output [11:0] data_to_mult_b5,
    output [11:0] data_to_mult_b6,
    output [11:0] data_to_mult_b7,
    output [11:0] data_to_mult_b8,
    output [11:0] data_to_mult_b9,
    output [11:0] data_to_mult_b10,
    output [11:0] data_to_mult_b11,
    output [11:0] data_to_mult_b12,
    output mult_valid
    );
    
    assign tready_out = 1'b1;
    
    reg [11:0] lookup0 [14:0];
    reg [11:0] lookup1 [14:0];
    reg [11:0] lookup2 [14:0];
    reg [11:0] lookup3 [14:0];
    reg [11:0] lookup4 [14:0];
    reg [11:0] lookup5 [14:0];
    reg [11:0] lookup6 [14:0];
    reg [11:0] lookup7 [14:0];
    reg [11:0] lookup8 [14:0];
    reg [11:0] lookup9 [14:0];
    reg [11:0] lookup10 [14:0];
    reg [11:0] lookup11 [14:0];
    reg [11:0] lookup12 [14:0];
    initial begin
        $readmemh("spec_cos0.mem", lookup0);
        $readmemh("spec_cos1.mem", lookup1);
        $readmemh("spec_cos2.mem", lookup2);
        $readmemh("spec_cos3.mem", lookup3);
        $readmemh("spec_cos4.mem", lookup4);
        $readmemh("spec_cos5.mem", lookup5);
        $readmemh("spec_cos6.mem", lookup6);
        $readmemh("spec_cos7.mem", lookup7);
        $readmemh("spec_cos8.mem", lookup8);
        $readmemh("spec_cos9.mem", lookup9);
        $readmemh("spec_cos10.mem", lookup10);
        $readmemh("spec_cos11.mem", lookup11);
        $readmemh("spec_cos12.mem", lookup12);
    end
    
    reg [15:0] data_to_mult_a_r;
    assign data_to_mult_a = data_to_mult_a_r;
    
    reg [3:0] filter_num_counter = 4'h0;
    
    assign data_to_mult_b0 = lookup0[filter_num_counter];
    assign data_to_mult_b1 = lookup1[filter_num_counter];
    assign data_to_mult_b2 = lookup2[filter_num_counter];
    assign data_to_mult_b3 = lookup3[filter_num_counter];
    assign data_to_mult_b4 = lookup4[filter_num_counter];
    assign data_to_mult_b5 = lookup5[filter_num_counter];
    assign data_to_mult_b6 = lookup6[filter_num_counter];
    assign data_to_mult_b7 = lookup7[filter_num_counter];
    assign data_to_mult_b8 = lookup8[filter_num_counter];
    assign data_to_mult_b9 = lookup9[filter_num_counter];
    assign data_to_mult_b10 = lookup10[filter_num_counter];
    assign data_to_mult_b11 = lookup11[filter_num_counter];
    assign data_to_mult_b12 = lookup12[filter_num_counter];
    
    reg mult_valid_r, mult_valid_rr, mult_valid_rrr, mult_valid_rrrr;
    assign mult_valid = mult_valid_rrrr;
    
    always @(posedge clk) begin
        if (tvalid_in) begin
            data_to_mult_a_r <= tdata_in;
            if (filter_num_counter == 4'he) begin
                filter_num_counter <= 4'h0;
            end
            else begin
                filter_num_counter <= filter_num_counter + 1;
            end
        end
        mult_valid_rrrr <= mult_valid_rrr;
        mult_valid_rrr <= mult_valid_rr;
        mult_valid_rr <= mult_valid_r;
        mult_valid_r <= tvalid_in;
    end
    
endmodule
