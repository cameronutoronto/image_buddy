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


module tb(

    );
    
    reg clk;
    reg [31:0] tdata_in;
    reg tvalid_in;
    wire [31:0] tdata_out;
    wire tvalid_out;
    
    logarithm logarithm_0(.clk(clk), .tdata_in(tdata_in), .tvalid_in(tvalid_in), .tdata_out(tdata_out), .tvalid_out(tvalid_out));

    always #5 clk = ~clk;
    
    initial begin
        clk = 1'b0;
        tdata_in = 1'b0;
        tvalid_in = 1'b0;
        
        repeat(5) @(posedge clk);
        
        tvalid_in = 1'b1;
        
        @(posedge clk);
        
        tvalid_in = 1'b0;
        
        @(posedge clk);
        
        tdata_in = 18'h3FFFF;
        tvalid_in = 1'b1;
        
        @(posedge clk);
        
        tdata_in = 18'h1BEEF;
        
        @(posedge clk);
        
        tvalid_in = 1'b0;
        
        repeat(5) @(posedge clk);
        $finish();
    
    end

endmodule
