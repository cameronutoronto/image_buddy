`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2018 04:42:48 PM
// Design Name: 
// Module Name: accumulate15_tb
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


module accumulate15_tb(

    );
    
    reg clk;
    reg mult_valid;
    reg [31:0] mult_data;
    wire [31:0] data_out;
    wire valid_out;
    
    accumulate15 dut(.clk(clk), .mult_valid(mult_valid), .mult_data(mult_data), .data_out(data_out), .valid_out(valid_out));

    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        mult_valid = 0;
        mult_data = 0;
        
        repeat (5) @(posedge clk);
        
        mult_data = 1;
        mult_valid = 1;
        
        repeat (10) @(posedge clk);
        
        mult_valid = 0;
        mult_data = 2;
        
        repeat (6) @(posedge clk);
        
        mult_valid = 1;
        mult_data = 3;
        
        repeat (10) @(posedge clk);
        $finish();
    
    end
    
endmodule
