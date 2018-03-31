`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/28/2018 12:44:59 PM
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
    
    
   wire [31:0]M00_AXIS_tdata;
    wire M00_AXIS_tlast;
    wire M00_AXIS_tready;
    wire [3:0]M00_AXIS_tstrb;
    wire M00_AXIS_tvalid;
    wire [31:0]M01_AXIS_tdata;
    wire M01_AXIS_tlast;
    wire M01_AXIS_tready;
    wire [3:0]M01_AXIS_tstrb;
    wire M01_AXIS_tvalid;
    wire [31:0]M02_AXIS_tdata;
    wire M02_AXIS_tlast;
    wire M02_AXIS_tready;
    wire [3:0]M02_AXIS_tstrb;
    wire M02_AXIS_tvalid;
    wire [31:0]M03_AXIS_tdata;
    wire M03_AXIS_tlast;
    wire M03_AXIS_tready;
    wire [3:0]M03_AXIS_tstrb;
    wire M03_AXIS_tvalid;
    reg btn_d;
    reg clk;
    wire mic_clk_o;
    reg mic_data_i;
    wire mic_lrsel_o;
    reg resetn;
  
    mic_axis_block mic_axis_block_i
         (.M00_AXIS_tdata(M00_AXIS_tdata),
          .M00_AXIS_tlast(M00_AXIS_tlast),
          .M00_AXIS_tready(M00_AXIS_tready),
          .M00_AXIS_tstrb(M00_AXIS_tstrb),
          .M00_AXIS_tvalid(M00_AXIS_tvalid),
          .M01_AXIS_tdata(M01_AXIS_tdata),
          .M01_AXIS_tlast(M01_AXIS_tlast),
          .M01_AXIS_tready(M01_AXIS_tready),
          .M01_AXIS_tstrb(M01_AXIS_tstrb),
          .M01_AXIS_tvalid(M01_AXIS_tvalid),
          .M02_AXIS_tdata(M02_AXIS_tdata),
          .M02_AXIS_tlast(M02_AXIS_tlast),
          .M02_AXIS_tready(M02_AXIS_tready),
          .M02_AXIS_tstrb(M02_AXIS_tstrb),
          .M02_AXIS_tvalid(M02_AXIS_tvalid),
          .M03_AXIS_tdata(M03_AXIS_tdata),
          .M03_AXIS_tlast(M03_AXIS_tlast),
          .M03_AXIS_tready(M03_AXIS_tready),
          .M03_AXIS_tstrb(M03_AXIS_tstrb),
          .M03_AXIS_tvalid(M03_AXIS_tvalid),
          .btn_d(btn_d),
          .clk(clk),
          .mic_clk_o(mic_clk_o),
          .mic_data_i(mic_data_i),
          .mic_lrsel_o(mic_lrsel_o),
          .resetn(resetn));
        
    assign M00_AXIS_tready = 1'b1;
    assign M01_AXIS_tready = 1'b1;
    assign M02_AXIS_tready = 1'b1;
    assign M03_AXIS_tready = 1'b1;
        
    always begin
        #5 clk = ~clk;
    end
    
    always begin
        #27 mic_data_i = ~mic_data_i;
    end
    
    initial begin
        clk = 0;
        resetn = 0;
        btn_d = 0;
        mic_data_i = 0;
        
        #20 resetn = 1;
        
        #2000 btn_d = 1;
        #10 btn_d = 0;
    end
    
endmodule
