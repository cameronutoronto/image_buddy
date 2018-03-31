`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2018 08:27:00 PM
// Design Name: 
// Module Name: deriv_maker_tb
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


module deriv_maker_tb(
    
    );
    
    reg clk;
    reg [31:0] data_in;
    reg valid_in;
    wire valid_out;
    wire [31:0] data_out;
    integer i;
    
    deriv_maker dut(.clk(clk), .data_in(data_in), .valid_in(valid_in), .valid_out(valid_out), .data_out(data_out));

    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        data_in = 32'b0;
        valid_in = 0;
        
        repeat (5) @(posedge clk);
        
        data_in = 32'b1;
        valid_in = 1;
        
        //repeat(64) @(posedge clk);
        
        
        for(i = 1; i < 64; i = i+1) begin
            @(posedge clk);
            valid_in = 0;
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
            data_in = i;
            valid_in = 1;
        end
        
        @(posedge clk);
        
        valid_in = 0;
        
        repeat (140) @(posedge clk);
        $finish();
    
    end
endmodule
