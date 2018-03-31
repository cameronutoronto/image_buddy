//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.2 (lin64) Build 1909853 Thu Jun 15 18:39:10 MDT 2017
//Date        : Fri Mar  9 16:50:23 2018
//Host        : ug237 running 64-bit Debian GNU/Linux 9.3 (stretch)
//Command     : generate_target fft_module_block_wrapper.bd
//Design      : fft_module_block_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module fft_module_block_wrapper
   (M_AXIS_FFT_MAG_DOUT_tdata,
    M_AXIS_FFT_MAG_DOUT_tlast,
    M_AXIS_FFT_MAG_DOUT_tuser,
    M_AXIS_FFT_MAG_DOUT_tvalid,
    S_AXIS_MIC_DATA_tdata,
    S_AXIS_MIC_DATA_tlast,
    S_AXIS_MIC_DATA_tready,
    S_AXIS_MIC_DATA_tvalid,
    aclk,
    aresetn);
  output [31:0]M_AXIS_FFT_MAG_DOUT_tdata;
  output M_AXIS_FFT_MAG_DOUT_tlast;
  output [7:0]M_AXIS_FFT_MAG_DOUT_tuser;
  output M_AXIS_FFT_MAG_DOUT_tvalid;
  input [15:0]S_AXIS_MIC_DATA_tdata;
  input S_AXIS_MIC_DATA_tlast;
  output S_AXIS_MIC_DATA_tready;
  input S_AXIS_MIC_DATA_tvalid;
  input aclk;
  input aresetn;

  wire [31:0]M_AXIS_FFT_MAG_DOUT_tdata;
  wire M_AXIS_FFT_MAG_DOUT_tlast;
  wire [7:0]M_AXIS_FFT_MAG_DOUT_tuser;
  wire M_AXIS_FFT_MAG_DOUT_tvalid;
  wire [15:0]S_AXIS_MIC_DATA_tdata;
  wire S_AXIS_MIC_DATA_tlast;
  wire S_AXIS_MIC_DATA_tready;
  wire S_AXIS_MIC_DATA_tvalid;
  wire aclk;
  wire aresetn;

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
endmodule
