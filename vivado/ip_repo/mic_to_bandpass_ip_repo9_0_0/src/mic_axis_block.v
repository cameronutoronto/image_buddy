//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.2 (lin64) Build 1909853 Thu Jun 15 18:39:10 MDT 2017
//Date        : Sun Mar 11 19:16:31 2018
//Host        : ug237 running 64-bit Debian GNU/Linux 9.4 (stretch)
//Command     : generate_target mic_axis_block.bd
//Design      : mic_axis_block
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "mic_axis_block,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=mic_axis_block,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=18,numReposBlks=18,numNonXlnxBlks=17,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=3,da_clkrst_cnt=3,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "mic_axis_block.hwdef" *) 
module mic_axis_block
   (M00_AXIS_tdata,
    M00_AXIS_tlast,
    M00_AXIS_tready,
    M00_AXIS_tstrb,
    M00_AXIS_tvalid,
    M01_AXIS_tdata,
    M01_AXIS_tlast,
    M01_AXIS_tready,
    M01_AXIS_tstrb,
    M01_AXIS_tvalid,
    M02_AXIS_tdata,
    M02_AXIS_tlast,
    M02_AXIS_tready,
    M02_AXIS_tstrb,
    M02_AXIS_tvalid,
    M03_AXIS_tdata,
    M03_AXIS_tlast,
    M03_AXIS_tready,
    M03_AXIS_tstrb,
    M03_AXIS_tvalid,
    M04_AXIS_tdata,
    M04_AXIS_tlast,
    M04_AXIS_tready,
    M04_AXIS_tstrb,
    M04_AXIS_tvalid,
    M05_AXIS_tdata,
    M05_AXIS_tlast,
    M05_AXIS_tready,
    M05_AXIS_tstrb,
    M05_AXIS_tvalid,
    M06_AXIS_tdata,
    M06_AXIS_tlast,
    M06_AXIS_tready,
    M06_AXIS_tstrb,
    M06_AXIS_tvalid,
    M07_AXIS_tdata,
    M07_AXIS_tlast,
    M07_AXIS_tready,
    M07_AXIS_tstrb,
    M07_AXIS_tvalid,
    M08_AXIS_tdata,
    M08_AXIS_tlast,
    M08_AXIS_tready,
    M08_AXIS_tstrb,
    M08_AXIS_tvalid,
    M09_AXIS_tdata,
    M09_AXIS_tlast,
    M09_AXIS_tready,
    M09_AXIS_tstrb,
    M09_AXIS_tvalid,
    M10_AXIS_tdata,
    M10_AXIS_tlast,
    M10_AXIS_tready,
    M10_AXIS_tstrb,
    M10_AXIS_tvalid,
    M11_AXIS_tdata,
    M11_AXIS_tlast,
    M11_AXIS_tready,
    M11_AXIS_tstrb,
    M11_AXIS_tvalid,
    M12_AXIS_tdata,
    M12_AXIS_tlast,
    M12_AXIS_tready,
    M12_AXIS_tstrb,
    M12_AXIS_tvalid,
    M13_AXIS_tdata,
    M13_AXIS_tlast,
    M13_AXIS_tready,
    M13_AXIS_tstrb,
    M13_AXIS_tvalid,
    M14_AXIS_tdata,
    M14_AXIS_tlast,
    M14_AXIS_tready,
    M14_AXIS_tstrb,
    M14_AXIS_tvalid,
    btn_d,
    clk,
    mic_clk_o,
    mic_data_i,
    mic_lrsel_o,
    resetn);
  output [31:0]M00_AXIS_tdata;
  output M00_AXIS_tlast;
  input M00_AXIS_tready;
  output [3:0]M00_AXIS_tstrb;
  output M00_AXIS_tvalid;
  output [31:0]M01_AXIS_tdata;
  output M01_AXIS_tlast;
  input M01_AXIS_tready;
  output [3:0]M01_AXIS_tstrb;
  output M01_AXIS_tvalid;
  output [31:0]M02_AXIS_tdata;
  output M02_AXIS_tlast;
  input M02_AXIS_tready;
  output [3:0]M02_AXIS_tstrb;
  output M02_AXIS_tvalid;
  output [31:0]M03_AXIS_tdata;
  output M03_AXIS_tlast;
  input M03_AXIS_tready;
  output [3:0]M03_AXIS_tstrb;
  output M03_AXIS_tvalid;
  output [31:0]M04_AXIS_tdata;
  output M04_AXIS_tlast;
  input M04_AXIS_tready;
  output [3:0]M04_AXIS_tstrb;
  output M04_AXIS_tvalid;
  output [31:0]M05_AXIS_tdata;
  output M05_AXIS_tlast;
  input M05_AXIS_tready;
  output [3:0]M05_AXIS_tstrb;
  output M05_AXIS_tvalid;
  output [31:0]M06_AXIS_tdata;
  output M06_AXIS_tlast;
  input M06_AXIS_tready;
  output [3:0]M06_AXIS_tstrb;
  output M06_AXIS_tvalid;
  output [31:0]M07_AXIS_tdata;
  output M07_AXIS_tlast;
  input M07_AXIS_tready;
  output [3:0]M07_AXIS_tstrb;
  output M07_AXIS_tvalid;
  output [31:0]M08_AXIS_tdata;
  output M08_AXIS_tlast;
  input M08_AXIS_tready;
  output [3:0]M08_AXIS_tstrb;
  output M08_AXIS_tvalid;
  output [31:0]M09_AXIS_tdata;
  output M09_AXIS_tlast;
  input M09_AXIS_tready;
  output [3:0]M09_AXIS_tstrb;
  output M09_AXIS_tvalid;
  output [31:0]M10_AXIS_tdata;
  output M10_AXIS_tlast;
  input M10_AXIS_tready;
  output [3:0]M10_AXIS_tstrb;
  output M10_AXIS_tvalid;
  output [31:0]M11_AXIS_tdata;
  output M11_AXIS_tlast;
  input M11_AXIS_tready;
  output [3:0]M11_AXIS_tstrb;
  output M11_AXIS_tvalid;
  output [31:0]M12_AXIS_tdata;
  output M12_AXIS_tlast;
  input M12_AXIS_tready;
  output [3:0]M12_AXIS_tstrb;
  output M12_AXIS_tvalid;
  output [31:0]M13_AXIS_tdata;
  output M13_AXIS_tlast;
  input M13_AXIS_tready;
  output [3:0]M13_AXIS_tstrb;
  output M13_AXIS_tvalid;
  output [31:0]M14_AXIS_tdata;
  output M14_AXIS_tlast;
  input M14_AXIS_tready;
  output [3:0]M14_AXIS_tstrb;
  output M14_AXIS_tvalid;
  input btn_d;
  input clk;
  output mic_clk_o;
  input mic_data_i;
  output mic_lrsel_o;
  input resetn;

  wire [31:0]bandpass_stream_0_M00_AXIS_TDATA;
  wire bandpass_stream_0_M00_AXIS_TLAST;
  wire bandpass_stream_0_M00_AXIS_TREADY;
  wire [3:0]bandpass_stream_0_M00_AXIS_TSTRB;
  wire bandpass_stream_0_M00_AXIS_TVALID;
  wire [31:0]bandpass_stream_10_M00_AXIS_TDATA;
  wire bandpass_stream_10_M00_AXIS_TLAST;
  wire bandpass_stream_10_M00_AXIS_TREADY;
  wire [3:0]bandpass_stream_10_M00_AXIS_TSTRB;
  wire bandpass_stream_10_M00_AXIS_TVALID;
  wire [31:0]bandpass_stream_11_M00_AXIS_TDATA;
  wire bandpass_stream_11_M00_AXIS_TLAST;
  wire bandpass_stream_11_M00_AXIS_TREADY;
  wire [3:0]bandpass_stream_11_M00_AXIS_TSTRB;
  wire bandpass_stream_11_M00_AXIS_TVALID;
  wire [31:0]bandpass_stream_12_M00_AXIS_TDATA;
  wire bandpass_stream_12_M00_AXIS_TLAST;
  wire bandpass_stream_12_M00_AXIS_TREADY;
  wire [3:0]bandpass_stream_12_M00_AXIS_TSTRB;
  wire bandpass_stream_12_M00_AXIS_TVALID;
  wire [31:0]bandpass_stream_13_M00_AXIS_TDATA;
  wire bandpass_stream_13_M00_AXIS_TLAST;
  wire bandpass_stream_13_M00_AXIS_TREADY;
  wire [3:0]bandpass_stream_13_M00_AXIS_TSTRB;
  wire bandpass_stream_13_M00_AXIS_TVALID;
  wire [31:0]bandpass_stream_14_M00_AXIS_TDATA;
  wire bandpass_stream_14_M00_AXIS_TLAST;
  wire bandpass_stream_14_M00_AXIS_TREADY;
  wire [3:0]bandpass_stream_14_M00_AXIS_TSTRB;
  wire bandpass_stream_14_M00_AXIS_TVALID;
  wire [31:0]bandpass_stream_1_M00_AXIS_TDATA;
  wire bandpass_stream_1_M00_AXIS_TLAST;
  wire bandpass_stream_1_M00_AXIS_TREADY;
  wire [3:0]bandpass_stream_1_M00_AXIS_TSTRB;
  wire bandpass_stream_1_M00_AXIS_TVALID;
  wire [31:0]bandpass_stream_2_M00_AXIS_TDATA;
  wire bandpass_stream_2_M00_AXIS_TLAST;
  wire bandpass_stream_2_M00_AXIS_TREADY;
  wire [3:0]bandpass_stream_2_M00_AXIS_TSTRB;
  wire bandpass_stream_2_M00_AXIS_TVALID;
  wire [31:0]bandpass_stream_3_M00_AXIS_TDATA;
  wire bandpass_stream_3_M00_AXIS_TLAST;
  wire bandpass_stream_3_M00_AXIS_TREADY;
  wire [3:0]bandpass_stream_3_M00_AXIS_TSTRB;
  wire bandpass_stream_3_M00_AXIS_TVALID;
  wire [31:0]bandpass_stream_4_M00_AXIS_TDATA;
  wire bandpass_stream_4_M00_AXIS_TLAST;
  wire bandpass_stream_4_M00_AXIS_TREADY;
  wire [3:0]bandpass_stream_4_M00_AXIS_TSTRB;
  wire bandpass_stream_4_M00_AXIS_TVALID;
  wire [31:0]bandpass_stream_5_M00_AXIS_TDATA;
  wire bandpass_stream_5_M00_AXIS_TLAST;
  wire bandpass_stream_5_M00_AXIS_TREADY;
  wire [3:0]bandpass_stream_5_M00_AXIS_TSTRB;
  wire bandpass_stream_5_M00_AXIS_TVALID;
  wire [31:0]bandpass_stream_6_M00_AXIS_TDATA;
  wire bandpass_stream_6_M00_AXIS_TLAST;
  wire bandpass_stream_6_M00_AXIS_TREADY;
  wire [3:0]bandpass_stream_6_M00_AXIS_TSTRB;
  wire bandpass_stream_6_M00_AXIS_TVALID;
  wire [31:0]bandpass_stream_7_M00_AXIS_TDATA;
  wire bandpass_stream_7_M00_AXIS_TLAST;
  wire bandpass_stream_7_M00_AXIS_TREADY;
  wire [3:0]bandpass_stream_7_M00_AXIS_TSTRB;
  wire bandpass_stream_7_M00_AXIS_TVALID;
  wire [31:0]bandpass_stream_8_M00_AXIS_TDATA;
  wire bandpass_stream_8_M00_AXIS_TLAST;
  wire bandpass_stream_8_M00_AXIS_TREADY;
  wire [3:0]bandpass_stream_8_M00_AXIS_TSTRB;
  wire bandpass_stream_8_M00_AXIS_TVALID;
  wire [31:0]bandpass_stream_9_M00_AXIS_TDATA;
  wire bandpass_stream_9_M00_AXIS_TLAST;
  wire bandpass_stream_9_M00_AXIS_TREADY;
  wire [3:0]bandpass_stream_9_M00_AXIS_TSTRB;
  wire bandpass_stream_9_M00_AXIS_TVALID;
  wire btn_d_1;
  wire clk_wiz_0_clk_out1;
  wire [31:0]fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tdata;
  wire fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tlast;
  wire fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tvalid;
  wire [15:0]mic_axis_ip_0_M00_AXIS_TDATA;
  wire mic_axis_ip_0_M00_AXIS_TLAST;
  wire mic_axis_ip_0_M00_AXIS_TREADY;
  wire mic_axis_ip_0_M00_AXIS_TVALID;
  wire mic_axis_ip_0_mic_clk_o;
  wire mic_axis_ip_0_mic_lrsel_o;
  wire mic_data_i_1;
  wire proc_sys_reset_0_peripheral_aresetn;
  wire [3:0]xlconstant_0_dout;

  assign M00_AXIS_tdata[31:0] = bandpass_stream_0_M00_AXIS_TDATA;
  assign M00_AXIS_tlast = bandpass_stream_0_M00_AXIS_TLAST;
  assign M00_AXIS_tstrb[3:0] = bandpass_stream_0_M00_AXIS_TSTRB;
  assign M00_AXIS_tvalid = bandpass_stream_0_M00_AXIS_TVALID;
  assign M01_AXIS_tdata[31:0] = bandpass_stream_1_M00_AXIS_TDATA;
  assign M01_AXIS_tlast = bandpass_stream_1_M00_AXIS_TLAST;
  assign M01_AXIS_tstrb[3:0] = bandpass_stream_1_M00_AXIS_TSTRB;
  assign M01_AXIS_tvalid = bandpass_stream_1_M00_AXIS_TVALID;
  assign M02_AXIS_tdata[31:0] = bandpass_stream_2_M00_AXIS_TDATA;
  assign M02_AXIS_tlast = bandpass_stream_2_M00_AXIS_TLAST;
  assign M02_AXIS_tstrb[3:0] = bandpass_stream_2_M00_AXIS_TSTRB;
  assign M02_AXIS_tvalid = bandpass_stream_2_M00_AXIS_TVALID;
  assign M03_AXIS_tdata[31:0] = bandpass_stream_3_M00_AXIS_TDATA;
  assign M03_AXIS_tlast = bandpass_stream_3_M00_AXIS_TLAST;
  assign M03_AXIS_tstrb[3:0] = bandpass_stream_3_M00_AXIS_TSTRB;
  assign M03_AXIS_tvalid = bandpass_stream_3_M00_AXIS_TVALID;
  assign M04_AXIS_tdata[31:0] = bandpass_stream_4_M00_AXIS_TDATA;
  assign M04_AXIS_tlast = bandpass_stream_4_M00_AXIS_TLAST;
  assign M04_AXIS_tstrb[3:0] = bandpass_stream_4_M00_AXIS_TSTRB;
  assign M04_AXIS_tvalid = bandpass_stream_4_M00_AXIS_TVALID;
  assign M05_AXIS_tdata[31:0] = bandpass_stream_5_M00_AXIS_TDATA;
  assign M05_AXIS_tlast = bandpass_stream_5_M00_AXIS_TLAST;
  assign M05_AXIS_tstrb[3:0] = bandpass_stream_5_M00_AXIS_TSTRB;
  assign M05_AXIS_tvalid = bandpass_stream_5_M00_AXIS_TVALID;
  assign M06_AXIS_tdata[31:0] = bandpass_stream_6_M00_AXIS_TDATA;
  assign M06_AXIS_tlast = bandpass_stream_6_M00_AXIS_TLAST;
  assign M06_AXIS_tstrb[3:0] = bandpass_stream_6_M00_AXIS_TSTRB;
  assign M06_AXIS_tvalid = bandpass_stream_6_M00_AXIS_TVALID;
  assign M07_AXIS_tdata[31:0] = bandpass_stream_7_M00_AXIS_TDATA;
  assign M07_AXIS_tlast = bandpass_stream_7_M00_AXIS_TLAST;
  assign M07_AXIS_tstrb[3:0] = bandpass_stream_7_M00_AXIS_TSTRB;
  assign M07_AXIS_tvalid = bandpass_stream_7_M00_AXIS_TVALID;
  assign M08_AXIS_tdata[31:0] = bandpass_stream_8_M00_AXIS_TDATA;
  assign M08_AXIS_tlast = bandpass_stream_8_M00_AXIS_TLAST;
  assign M08_AXIS_tstrb[3:0] = bandpass_stream_8_M00_AXIS_TSTRB;
  assign M08_AXIS_tvalid = bandpass_stream_8_M00_AXIS_TVALID;
  assign M09_AXIS_tdata[31:0] = bandpass_stream_9_M00_AXIS_TDATA;
  assign M09_AXIS_tlast = bandpass_stream_9_M00_AXIS_TLAST;
  assign M09_AXIS_tstrb[3:0] = bandpass_stream_9_M00_AXIS_TSTRB;
  assign M09_AXIS_tvalid = bandpass_stream_9_M00_AXIS_TVALID;
  assign M10_AXIS_tdata[31:0] = bandpass_stream_10_M00_AXIS_TDATA;
  assign M10_AXIS_tlast = bandpass_stream_10_M00_AXIS_TLAST;
  assign M10_AXIS_tstrb[3:0] = bandpass_stream_10_M00_AXIS_TSTRB;
  assign M10_AXIS_tvalid = bandpass_stream_10_M00_AXIS_TVALID;
  assign M11_AXIS_tdata[31:0] = bandpass_stream_11_M00_AXIS_TDATA;
  assign M11_AXIS_tlast = bandpass_stream_11_M00_AXIS_TLAST;
  assign M11_AXIS_tstrb[3:0] = bandpass_stream_11_M00_AXIS_TSTRB;
  assign M11_AXIS_tvalid = bandpass_stream_11_M00_AXIS_TVALID;
  assign M12_AXIS_tdata[31:0] = bandpass_stream_12_M00_AXIS_TDATA;
  assign M12_AXIS_tlast = bandpass_stream_12_M00_AXIS_TLAST;
  assign M12_AXIS_tstrb[3:0] = bandpass_stream_12_M00_AXIS_TSTRB;
  assign M12_AXIS_tvalid = bandpass_stream_12_M00_AXIS_TVALID;
  assign M13_AXIS_tdata[31:0] = bandpass_stream_13_M00_AXIS_TDATA;
  assign M13_AXIS_tlast = bandpass_stream_13_M00_AXIS_TLAST;
  assign M13_AXIS_tstrb[3:0] = bandpass_stream_13_M00_AXIS_TSTRB;
  assign M13_AXIS_tvalid = bandpass_stream_13_M00_AXIS_TVALID;
  assign M14_AXIS_tdata[31:0] = bandpass_stream_14_M00_AXIS_TDATA;
  assign M14_AXIS_tlast = bandpass_stream_14_M00_AXIS_TLAST;
  assign M14_AXIS_tstrb[3:0] = bandpass_stream_14_M00_AXIS_TSTRB;
  assign M14_AXIS_tvalid = bandpass_stream_14_M00_AXIS_TVALID;
  assign bandpass_stream_0_M00_AXIS_TREADY = M00_AXIS_tready;
  assign bandpass_stream_10_M00_AXIS_TREADY = M10_AXIS_tready;
  assign bandpass_stream_11_M00_AXIS_TREADY = M11_AXIS_tready;
  assign bandpass_stream_12_M00_AXIS_TREADY = M12_AXIS_tready;
  assign bandpass_stream_13_M00_AXIS_TREADY = M13_AXIS_tready;
  assign bandpass_stream_14_M00_AXIS_TREADY = M14_AXIS_tready;
  assign bandpass_stream_1_M00_AXIS_TREADY = M01_AXIS_tready;
  assign bandpass_stream_2_M00_AXIS_TREADY = M02_AXIS_tready;
  assign bandpass_stream_3_M00_AXIS_TREADY = M03_AXIS_tready;
  assign bandpass_stream_4_M00_AXIS_TREADY = M04_AXIS_tready;
  assign bandpass_stream_5_M00_AXIS_TREADY = M05_AXIS_tready;
  assign bandpass_stream_6_M00_AXIS_TREADY = M06_AXIS_tready;
  assign bandpass_stream_7_M00_AXIS_TREADY = M07_AXIS_tready;
  assign bandpass_stream_8_M00_AXIS_TREADY = M08_AXIS_tready;
  assign bandpass_stream_9_M00_AXIS_TREADY = M09_AXIS_tready;
  assign btn_d_1 = btn_d;
  assign clk_wiz_0_clk_out1 = clk;
  assign mic_clk_o = mic_axis_ip_0_mic_clk_o;
  assign mic_data_i_1 = mic_data_i;
  assign mic_lrsel_o = mic_axis_ip_0_mic_lrsel_o;
  assign proc_sys_reset_0_peripheral_aresetn = resetn;
  mic_axis_block_bandpass_stream_0_0 bandpass_stream_0
       (.m00_axis_aclk(clk_wiz_0_clk_out1),
        .m00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m00_axis_tdata(bandpass_stream_0_M00_AXIS_TDATA),
        .m00_axis_tlast(bandpass_stream_0_M00_AXIS_TLAST),
        .m00_axis_tready(bandpass_stream_0_M00_AXIS_TREADY),
        .m00_axis_tstrb(bandpass_stream_0_M00_AXIS_TSTRB),
        .m00_axis_tvalid(bandpass_stream_0_M00_AXIS_TVALID),
        .s00_axis_aclk(clk_wiz_0_clk_out1),
        .s00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axis_tdata(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tdata),
        .s00_axis_tlast(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tlast),
        .s00_axis_tstrb(xlconstant_0_dout),
        .s00_axis_tvalid(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tvalid));
  mic_axis_block_bandpass_stream_0_1 bandpass_stream_1
       (.m00_axis_aclk(clk_wiz_0_clk_out1),
        .m00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m00_axis_tdata(bandpass_stream_1_M00_AXIS_TDATA),
        .m00_axis_tlast(bandpass_stream_1_M00_AXIS_TLAST),
        .m00_axis_tready(bandpass_stream_1_M00_AXIS_TREADY),
        .m00_axis_tstrb(bandpass_stream_1_M00_AXIS_TSTRB),
        .m00_axis_tvalid(bandpass_stream_1_M00_AXIS_TVALID),
        .s00_axis_aclk(clk_wiz_0_clk_out1),
        .s00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axis_tdata(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tdata),
        .s00_axis_tlast(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tlast),
        .s00_axis_tstrb(xlconstant_0_dout),
        .s00_axis_tvalid(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tvalid));
  mic_axis_block_bandpass_stream_9_0 bandpass_stream_10
       (.m00_axis_aclk(clk_wiz_0_clk_out1),
        .m00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m00_axis_tdata(bandpass_stream_10_M00_AXIS_TDATA),
        .m00_axis_tlast(bandpass_stream_10_M00_AXIS_TLAST),
        .m00_axis_tready(bandpass_stream_10_M00_AXIS_TREADY),
        .m00_axis_tstrb(bandpass_stream_10_M00_AXIS_TSTRB),
        .m00_axis_tvalid(bandpass_stream_10_M00_AXIS_TVALID),
        .s00_axis_aclk(clk_wiz_0_clk_out1),
        .s00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axis_tdata(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tdata),
        .s00_axis_tlast(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tlast),
        .s00_axis_tstrb(xlconstant_0_dout),
        .s00_axis_tvalid(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tvalid));
  mic_axis_block_bandpass_stream_10_0 bandpass_stream_11
       (.m00_axis_aclk(clk_wiz_0_clk_out1),
        .m00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m00_axis_tdata(bandpass_stream_11_M00_AXIS_TDATA),
        .m00_axis_tlast(bandpass_stream_11_M00_AXIS_TLAST),
        .m00_axis_tready(bandpass_stream_11_M00_AXIS_TREADY),
        .m00_axis_tstrb(bandpass_stream_11_M00_AXIS_TSTRB),
        .m00_axis_tvalid(bandpass_stream_11_M00_AXIS_TVALID),
        .s00_axis_aclk(clk_wiz_0_clk_out1),
        .s00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axis_tdata(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tdata),
        .s00_axis_tlast(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tlast),
        .s00_axis_tstrb(xlconstant_0_dout),
        .s00_axis_tvalid(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tvalid));
  mic_axis_block_bandpass_stream_11_0 bandpass_stream_12
       (.m00_axis_aclk(clk_wiz_0_clk_out1),
        .m00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m00_axis_tdata(bandpass_stream_12_M00_AXIS_TDATA),
        .m00_axis_tlast(bandpass_stream_12_M00_AXIS_TLAST),
        .m00_axis_tready(bandpass_stream_12_M00_AXIS_TREADY),
        .m00_axis_tstrb(bandpass_stream_12_M00_AXIS_TSTRB),
        .m00_axis_tvalid(bandpass_stream_12_M00_AXIS_TVALID),
        .s00_axis_aclk(clk_wiz_0_clk_out1),
        .s00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axis_tdata(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tdata),
        .s00_axis_tlast(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tlast),
        .s00_axis_tstrb(xlconstant_0_dout),
        .s00_axis_tvalid(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tvalid));
  mic_axis_block_bandpass_stream_12_0 bandpass_stream_13
       (.m00_axis_aclk(clk_wiz_0_clk_out1),
        .m00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m00_axis_tdata(bandpass_stream_13_M00_AXIS_TDATA),
        .m00_axis_tlast(bandpass_stream_13_M00_AXIS_TLAST),
        .m00_axis_tready(bandpass_stream_13_M00_AXIS_TREADY),
        .m00_axis_tstrb(bandpass_stream_13_M00_AXIS_TSTRB),
        .m00_axis_tvalid(bandpass_stream_13_M00_AXIS_TVALID),
        .s00_axis_aclk(clk_wiz_0_clk_out1),
        .s00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axis_tdata(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tdata),
        .s00_axis_tlast(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tlast),
        .s00_axis_tstrb(xlconstant_0_dout),
        .s00_axis_tvalid(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tvalid));
  mic_axis_block_bandpass_stream_13_0 bandpass_stream_14
       (.m00_axis_aclk(clk_wiz_0_clk_out1),
        .m00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m00_axis_tdata(bandpass_stream_14_M00_AXIS_TDATA),
        .m00_axis_tlast(bandpass_stream_14_M00_AXIS_TLAST),
        .m00_axis_tready(bandpass_stream_14_M00_AXIS_TREADY),
        .m00_axis_tstrb(bandpass_stream_14_M00_AXIS_TSTRB),
        .m00_axis_tvalid(bandpass_stream_14_M00_AXIS_TVALID),
        .s00_axis_aclk(clk_wiz_0_clk_out1),
        .s00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axis_tdata(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tdata),
        .s00_axis_tlast(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tlast),
        .s00_axis_tstrb(xlconstant_0_dout),
        .s00_axis_tvalid(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tvalid));
  mic_axis_block_bandpass_stream_1_0 bandpass_stream_2
       (.m00_axis_aclk(clk_wiz_0_clk_out1),
        .m00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m00_axis_tdata(bandpass_stream_2_M00_AXIS_TDATA),
        .m00_axis_tlast(bandpass_stream_2_M00_AXIS_TLAST),
        .m00_axis_tready(bandpass_stream_2_M00_AXIS_TREADY),
        .m00_axis_tstrb(bandpass_stream_2_M00_AXIS_TSTRB),
        .m00_axis_tvalid(bandpass_stream_2_M00_AXIS_TVALID),
        .s00_axis_aclk(clk_wiz_0_clk_out1),
        .s00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axis_tdata(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tdata),
        .s00_axis_tlast(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tlast),
        .s00_axis_tstrb(xlconstant_0_dout),
        .s00_axis_tvalid(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tvalid));
  mic_axis_block_bandpass_stream_2_0 bandpass_stream_3
       (.m00_axis_aclk(clk_wiz_0_clk_out1),
        .m00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m00_axis_tdata(bandpass_stream_3_M00_AXIS_TDATA),
        .m00_axis_tlast(bandpass_stream_3_M00_AXIS_TLAST),
        .m00_axis_tready(bandpass_stream_3_M00_AXIS_TREADY),
        .m00_axis_tstrb(bandpass_stream_3_M00_AXIS_TSTRB),
        .m00_axis_tvalid(bandpass_stream_3_M00_AXIS_TVALID),
        .s00_axis_aclk(clk_wiz_0_clk_out1),
        .s00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axis_tdata(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tdata),
        .s00_axis_tlast(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tlast),
        .s00_axis_tstrb(xlconstant_0_dout),
        .s00_axis_tvalid(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tvalid));
  mic_axis_block_bandpass_stream_3_0 bandpass_stream_4
       (.m00_axis_aclk(clk_wiz_0_clk_out1),
        .m00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m00_axis_tdata(bandpass_stream_4_M00_AXIS_TDATA),
        .m00_axis_tlast(bandpass_stream_4_M00_AXIS_TLAST),
        .m00_axis_tready(bandpass_stream_4_M00_AXIS_TREADY),
        .m00_axis_tstrb(bandpass_stream_4_M00_AXIS_TSTRB),
        .m00_axis_tvalid(bandpass_stream_4_M00_AXIS_TVALID),
        .s00_axis_aclk(clk_wiz_0_clk_out1),
        .s00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axis_tdata(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tdata),
        .s00_axis_tlast(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tlast),
        .s00_axis_tstrb(xlconstant_0_dout),
        .s00_axis_tvalid(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tvalid));
  mic_axis_block_bandpass_stream_4_0 bandpass_stream_5
       (.m00_axis_aclk(clk_wiz_0_clk_out1),
        .m00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m00_axis_tdata(bandpass_stream_5_M00_AXIS_TDATA),
        .m00_axis_tlast(bandpass_stream_5_M00_AXIS_TLAST),
        .m00_axis_tready(bandpass_stream_5_M00_AXIS_TREADY),
        .m00_axis_tstrb(bandpass_stream_5_M00_AXIS_TSTRB),
        .m00_axis_tvalid(bandpass_stream_5_M00_AXIS_TVALID),
        .s00_axis_aclk(clk_wiz_0_clk_out1),
        .s00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axis_tdata(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tdata),
        .s00_axis_tlast(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tlast),
        .s00_axis_tstrb(xlconstant_0_dout),
        .s00_axis_tvalid(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tvalid));
  mic_axis_block_bandpass_stream_5_0 bandpass_stream_6
       (.m00_axis_aclk(clk_wiz_0_clk_out1),
        .m00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m00_axis_tdata(bandpass_stream_6_M00_AXIS_TDATA),
        .m00_axis_tlast(bandpass_stream_6_M00_AXIS_TLAST),
        .m00_axis_tready(bandpass_stream_6_M00_AXIS_TREADY),
        .m00_axis_tstrb(bandpass_stream_6_M00_AXIS_TSTRB),
        .m00_axis_tvalid(bandpass_stream_6_M00_AXIS_TVALID),
        .s00_axis_aclk(clk_wiz_0_clk_out1),
        .s00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axis_tdata(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tdata),
        .s00_axis_tlast(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tlast),
        .s00_axis_tstrb(xlconstant_0_dout),
        .s00_axis_tvalid(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tvalid));
  mic_axis_block_bandpass_stream_6_0 bandpass_stream_7
       (.m00_axis_aclk(clk_wiz_0_clk_out1),
        .m00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m00_axis_tdata(bandpass_stream_7_M00_AXIS_TDATA),
        .m00_axis_tlast(bandpass_stream_7_M00_AXIS_TLAST),
        .m00_axis_tready(bandpass_stream_7_M00_AXIS_TREADY),
        .m00_axis_tstrb(bandpass_stream_7_M00_AXIS_TSTRB),
        .m00_axis_tvalid(bandpass_stream_7_M00_AXIS_TVALID),
        .s00_axis_aclk(clk_wiz_0_clk_out1),
        .s00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axis_tdata(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tdata),
        .s00_axis_tlast(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tlast),
        .s00_axis_tstrb(xlconstant_0_dout),
        .s00_axis_tvalid(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tvalid));
  mic_axis_block_bandpass_stream_7_0 bandpass_stream_8
       (.m00_axis_aclk(clk_wiz_0_clk_out1),
        .m00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m00_axis_tdata(bandpass_stream_8_M00_AXIS_TDATA),
        .m00_axis_tlast(bandpass_stream_8_M00_AXIS_TLAST),
        .m00_axis_tready(bandpass_stream_8_M00_AXIS_TREADY),
        .m00_axis_tstrb(bandpass_stream_8_M00_AXIS_TSTRB),
        .m00_axis_tvalid(bandpass_stream_8_M00_AXIS_TVALID),
        .s00_axis_aclk(clk_wiz_0_clk_out1),
        .s00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axis_tdata(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tdata),
        .s00_axis_tlast(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tlast),
        .s00_axis_tstrb(xlconstant_0_dout),
        .s00_axis_tvalid(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tvalid));
  mic_axis_block_bandpass_stream_8_0 bandpass_stream_9
       (.m00_axis_aclk(clk_wiz_0_clk_out1),
        .m00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m00_axis_tdata(bandpass_stream_9_M00_AXIS_TDATA),
        .m00_axis_tlast(bandpass_stream_9_M00_AXIS_TLAST),
        .m00_axis_tready(bandpass_stream_9_M00_AXIS_TREADY),
        .m00_axis_tstrb(bandpass_stream_9_M00_AXIS_TSTRB),
        .m00_axis_tvalid(bandpass_stream_9_M00_AXIS_TVALID),
        .s00_axis_aclk(clk_wiz_0_clk_out1),
        .s00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .s00_axis_tdata(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tdata),
        .s00_axis_tlast(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tlast),
        .s00_axis_tstrb(xlconstant_0_dout),
        .s00_axis_tvalid(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tvalid));
  mic_axis_block_fft_module_block_wrapper_0_1 fft_module_block_wrapper_0
       (.M_AXIS_FFT_MAG_DOUT_tdata(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tdata),
        .M_AXIS_FFT_MAG_DOUT_tlast(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tlast),
        .M_AXIS_FFT_MAG_DOUT_tvalid(fft_module_block_wrapper_0_M_AXIS_FFT_MAG_DOUT_tvalid),
        .S_AXIS_MIC_DATA_tdata(mic_axis_ip_0_M00_AXIS_TDATA),
        .S_AXIS_MIC_DATA_tlast(mic_axis_ip_0_M00_AXIS_TLAST),
        .S_AXIS_MIC_DATA_tready(mic_axis_ip_0_M00_AXIS_TREADY),
        .S_AXIS_MIC_DATA_tvalid(mic_axis_ip_0_M00_AXIS_TVALID),
        .aclk(clk_wiz_0_clk_out1),
        .aresetn(proc_sys_reset_0_peripheral_aresetn));
  mic_axis_block_mic_axis_ip_0_0 mic_axis_ip_0
       (.btn_d(btn_d_1),
        .m00_axis_aclk(clk_wiz_0_clk_out1),
        .m00_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m00_axis_tdata(mic_axis_ip_0_M00_AXIS_TDATA),
        .m00_axis_tlast(mic_axis_ip_0_M00_AXIS_TLAST),
        .m00_axis_tready(mic_axis_ip_0_M00_AXIS_TREADY),
        .m00_axis_tvalid(mic_axis_ip_0_M00_AXIS_TVALID),
        .mic_clk_o(mic_axis_ip_0_mic_clk_o),
        .mic_data_i(mic_data_i_1),
        .mic_lrsel_o(mic_axis_ip_0_mic_lrsel_o));
  mic_axis_block_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule
