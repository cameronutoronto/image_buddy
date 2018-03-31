`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2018 01:00:36 PM
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
    
    
    wire [31:0]M_AXIS_FFT_MAG_DOUT_tdata;
    wire M_AXIS_FFT_MAG_DOUT_tlast;
    wire [15:0]M_AXIS_FFT_MAG_DOUT_tuser;
    wire M_AXIS_FFT_MAG_DOUT_tvalid;
    reg [31:0]S_AXIS_MIC_DATA_tdata;
    reg S_AXIS_MIC_DATA_tlast;
    wire S_AXIS_MIC_DATA_tready;
    reg S_AXIS_MIC_DATA_tvalid;
    reg aclk;
    reg aresetn;
  
    fft_module_block fft_module_block_i
         (.M_AXIS_FFT_MAG_DOUT_tdata(M_AXIS_FFT_MAG_DOUT_tdata),
          .M_AXIS_FFT_MAG_DOUT_tlast(M_AXIS_FFT_MAG_DOUT_tlast),
          .M_AXIS_FFT_MAG_DOUT_tuser(M_AXIS_FFT_MAG_DOUT_tuser),
          .M_AXIS_FFT_MAG_DOUT_tvalid(M_AXIS_FFT_MAG_DOUT_tvalid),
          .S_AXIS_MIC_DATA_tdata(S_AXIS_MIC_DATA_tdata),
          .S_AXIS_MIC_DATA_tlast(S_AXIS_MIC_DATA_tlast),
          .S_AXIS_MIC_DATA_tready(S_AXIS_MIC_DATA_tready),
          .S_AXIS_MIC_DATA_tvalid(S_AXIS_MIC_DATA_tvalid),
          .aclk(aclk),
          .aresetn(aresetn));
    
    
    always #5 aclk = ~aclk;
    
    initial begin
        S_AXIS_MIC_DATA_tvalid = 1'b1;
        S_AXIS_MIC_DATA_tlast = 1'b0;
        S_AXIS_MIC_DATA_tdata = 3728;
        aclk = 1'b0;
        aresetn = 1'b0;
        #20 aresetn = 1'b1;
    end
    
endmodule
