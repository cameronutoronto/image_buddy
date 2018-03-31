`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2018 01:45:03 PM
// Design Name: 
// Module Name: tb
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


module interconnect_tb(

    );
    
    reg p_ready;
    reg [14:0] d_valid;
    reg [31:0] data_in_00;
    reg [31:0] data_in_01;
    reg [31:0] data_in_02;
    reg [31:0] data_in_03;
    reg [31:0] data_in_04;
    reg [31:0] data_in_05;
    reg [31:0] data_in_06;
    reg [31:0] data_in_07;
    reg [31:0] data_in_08;
    reg [31:0] data_in_09;
    reg [31:0] data_in_10;
    reg [31:0] data_in_11;
    reg [31:0] data_in_12;
    reg [31:0] data_in_13;
    reg [31:0] data_in_14;
    reg clk;
    wire [31:0] data_out;
    wire [14:0] i_ready;
    wire d_valid_out;
    
    axis_interconnect_v11 interconnect_0(.clk(clk), .p_ready(p_ready), .d_valid(d_valid), .data_in_00(data_in_00), .data_in_01(data_in_01),
                                    .data_in_02(data_in_02), .data_in_03(data_in_03), .data_in_04(data_in_04), .data_in_05(data_in_05),
                                    .data_in_06(data_in_06), .data_in_07(data_in_07), .data_in_08(data_in_08), .data_in_09(data_in_09),
                                    .data_in_10(data_in_10), .data_in_11(data_in_11), .data_in_12(data_in_12), .data_in_13(data_in_13),
                                    .data_in_14(data_in_14), .d_valid_out(d_valid_out), .i_ready(i_ready), .data_out(data_out));

    always #5 clk = ~clk;
    
    initial begin
        clk = 1'b0;
        p_ready = 1'b0;
        d_valid = 15'h0000;
        data_in_00 = 32'h00000001;
        data_in_01 = 32'h00000002;
        data_in_02 = 32'h00000003;
        data_in_03 = 32'h00000004;
        data_in_04 = 32'h00000005;
        data_in_05 = 32'h00000006;
        data_in_06 = 32'h00000007;
        data_in_07 = 32'h00000008;
        data_in_08 = 32'h00000009;
        data_in_09 = 32'h0000000a;
        data_in_10 = 32'h0000000b;
        data_in_11 = 32'h0000000c;
        data_in_12 = 32'h0000000d;
        data_in_13 = 32'h0000000e;
        data_in_14 = 32'h0000000f;
        
        repeat(5) @(posedge clk);
        
        d_valid = 15'h0004;
        
        @(posedge clk);
        
        p_ready = 1'b1;
        
        @(posedge clk);
        
        d_valid = 15'h0005;
        
        repeat(5) @(posedge clk);
        
        d_valid = 15'h0006;
        
        repeat(2) @(posedge clk);
        
        p_ready = 1'b0;
        
        repeat(6) @(posedge clk);
        
        p_ready = 1'b1;
        
        repeat(5) @(posedge clk);
        $finish();
    
    end

endmodule
