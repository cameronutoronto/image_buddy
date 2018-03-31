`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2018 03:40:37 PM
// Design Name: 
// Module Name: cepstral_tb
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


module cepstral_tb(

    );
    
    reg clk;
    reg [15:0] tdata_in;
    reg tvalid_in;
    wire tready_out;
    
    reg tready_in;
    wire [15:0] data_to_mult_a;
    wire [15:0] data_to_mult_b0;
    wire [15:0] data_to_mult_b1;
    wire [15:0] data_to_mult_b2;
    wire [15:0] data_to_mult_b3;
    wire [15:0] data_to_mult_b4;
    wire [15:0] data_to_mult_b5;
    wire [15:0] data_to_mult_b6;
    wire [15:0] data_to_mult_b7;
    wire [15:0] data_to_mult_b8;
    wire [15:0] data_to_mult_b9;
    wire [15:0] data_to_mult_b10;
    wire [15:0] data_to_mult_b11;
    wire [15:0] data_to_mult_b12;
    wire mult_valid;
    
    get_values get_values_i(
        .clk(clk),
        .tdata_in(tdata_in),
        .tvalid_in(tvalid_in),
        .tready_out(tready_out),
        .tready_in(tready_in),
        .data_to_mult_a(data_to_mult_a),
        .data_to_mult_b0(data_to_mult_b0),
        .data_to_mult_b1(data_to_mult_b1),
        .data_to_mult_b2(data_to_mult_b2),
        .data_to_mult_b3(data_to_mult_b3),
        .data_to_mult_b4(data_to_mult_b4),
        .data_to_mult_b5(data_to_mult_b5),
        .data_to_mult_b6(data_to_mult_b6),
        .data_to_mult_b7(data_to_mult_b7),
        .data_to_mult_b8(data_to_mult_b8),
        .data_to_mult_b9(data_to_mult_b9),
        .data_to_mult_b10(data_to_mult_b10),
        .data_to_mult_b11(data_to_mult_b11),
        .data_to_mult_b12(data_to_mult_b12),
        .mult_valid(mult_valid)
        );
        
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        
        repeat (5) @(posedge clk);
        
        tdata_in = 16'h1;
        tvalid_in = 1'b1;
        
        repeat (100) @(posedge clk);
        $finish();
    end
    
endmodule
