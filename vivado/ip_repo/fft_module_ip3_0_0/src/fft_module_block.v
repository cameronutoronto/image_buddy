//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.2 (lin64) Build 1909853 Thu Jun 15 18:39:10 MDT 2017
//Date        : Fri Mar  9 16:50:23 2018
//Host        : ug237 running 64-bit Debian GNU/Linux 9.3 (stretch)
//Command     : generate_target fft_module_block.bd
//Design      : fft_module_block
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "fft_module_block,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=fft_module_block,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=16,numReposBlks=16,numNonXlnxBlks=5,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=10,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "fft_module_block.hwdef" *) 
module fft_module_block
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

  wire [15:0]S_AXIS_DATA_1_TDATA;
  wire S_AXIS_DATA_1_TLAST;
  wire S_AXIS_DATA_1_TREADY;
  wire S_AXIS_DATA_1_TVALID;
  wire aclk_1;
  wire aresetn_1;
  wire axis_register_slice_0_m_axis_tlast;
  wire [7:0]axis_register_slice_0_m_axis_tuser;
  wire axis_register_slice_0_m_axis_tvalid;
  wire [47:0]c_addsub_0_S;
  wire [31:0]cordic_0_M_AXIS_DOUT_TDATA;
  wire cordic_0_M_AXIS_DOUT_TLAST;
  wire [7:0]cordic_0_M_AXIS_DOUT_TUSER;
  wire cordic_0_M_AXIS_DOUT_TVALID;
  wire delay_reg_0_tlast_out;
  wire [7:0]delay_reg_0_tuser_out;
  wire delay_reg_0_tvalid_out;
  wire delay_reg_1_tlast_out;
  wire [7:0]delay_reg_1_tuser_out;
  wire delay_reg_1_tvalid_out;
  wire delay_reg_2_tlast_out;
  wire [7:0]delay_reg_2_tuser_out;
  wire delay_reg_2_tvalid_out;
  wire delay_reg_3_tlast_out;
  wire [7:0]delay_reg_3_tuser_out;
  wire delay_reg_3_tvalid_out;
  wire delay_reg_4_tlast_out;
  wire [7:0]delay_reg_4_tuser_out;
  wire delay_reg_4_tvalid_out;
  wire [47:0]mult_gen_0_P;
  wire [47:0]mult_gen_1_P;
  wire xfft_0_M_AXIS_DATA_TLAST;
  wire xfft_0_M_AXIS_DATA_TREADY;
  wire [7:0]xfft_0_M_AXIS_DATA_TUSER;
  wire xfft_0_M_AXIS_DATA_TVALID;
  wire [47:0]xfft_0_m_axis_data_tdata;
  wire [0:0]xlconstant_0_dout;
  wire [7:0]xlconstant_1_dout;
  wire [0:0]xlconstant_2_dout;
  wire [23:0]xlslice_0_Dout;
  wire [23:0]xlslice_1_Dout;

  assign M_AXIS_FFT_MAG_DOUT_tdata[31:0] = cordic_0_M_AXIS_DOUT_TDATA;
  assign M_AXIS_FFT_MAG_DOUT_tlast = cordic_0_M_AXIS_DOUT_TLAST;
  assign M_AXIS_FFT_MAG_DOUT_tuser[7:0] = cordic_0_M_AXIS_DOUT_TUSER;
  assign M_AXIS_FFT_MAG_DOUT_tvalid = cordic_0_M_AXIS_DOUT_TVALID;
  assign S_AXIS_DATA_1_TDATA = S_AXIS_MIC_DATA_tdata[15:0];
  assign S_AXIS_DATA_1_TLAST = S_AXIS_MIC_DATA_tlast;
  assign S_AXIS_DATA_1_TVALID = S_AXIS_MIC_DATA_tvalid;
  assign S_AXIS_MIC_DATA_tready = S_AXIS_DATA_1_TREADY;
  assign aclk_1 = aclk;
  assign aresetn_1 = aresetn;
  fft_module_block_axis_register_slice_0_0 axis_register_slice_0
       (.aclk(aclk_1),
        .aresetn(aresetn_1),
        .m_axis_tlast(axis_register_slice_0_m_axis_tlast),
        .m_axis_tready(xlconstant_2_dout),
        .m_axis_tuser(axis_register_slice_0_m_axis_tuser),
        .m_axis_tvalid(axis_register_slice_0_m_axis_tvalid),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tlast(xfft_0_M_AXIS_DATA_TLAST),
        .s_axis_tready(xfft_0_M_AXIS_DATA_TREADY),
        .s_axis_tuser(xfft_0_M_AXIS_DATA_TUSER),
        .s_axis_tvalid(xfft_0_M_AXIS_DATA_TVALID));
  fft_module_block_c_addsub_0_0 c_addsub_0
       (.A(mult_gen_0_P),
        .B(mult_gen_1_P),
        .CLK(aclk_1),
        .S(c_addsub_0_S));
  fft_module_block_cordic_0_0 cordic_0
       (.aclk(aclk_1),
        .m_axis_dout_tdata(cordic_0_M_AXIS_DOUT_TDATA),
        .m_axis_dout_tlast(cordic_0_M_AXIS_DOUT_TLAST),
        .m_axis_dout_tuser(cordic_0_M_AXIS_DOUT_TUSER),
        .m_axis_dout_tvalid(cordic_0_M_AXIS_DOUT_TVALID),
        .s_axis_cartesian_tdata(c_addsub_0_S),
        .s_axis_cartesian_tlast(delay_reg_4_tlast_out),
        .s_axis_cartesian_tuser(delay_reg_4_tuser_out),
        .s_axis_cartesian_tvalid(delay_reg_4_tvalid_out));
  fft_module_block_delay_reg_0_0 delay_reg_0
       (.clk(aclk_1),
        .tlast_in(axis_register_slice_0_m_axis_tlast),
        .tlast_out(delay_reg_0_tlast_out),
        .tuser_in(axis_register_slice_0_m_axis_tuser),
        .tuser_out(delay_reg_0_tuser_out),
        .tvalid_in(axis_register_slice_0_m_axis_tvalid),
        .tvalid_out(delay_reg_0_tvalid_out));
  fft_module_block_delay_reg_0_1 delay_reg_1
       (.clk(aclk_1),
        .tlast_in(delay_reg_0_tlast_out),
        .tlast_out(delay_reg_1_tlast_out),
        .tuser_in(delay_reg_0_tuser_out),
        .tuser_out(delay_reg_1_tuser_out),
        .tvalid_in(delay_reg_0_tvalid_out),
        .tvalid_out(delay_reg_1_tvalid_out));
  fft_module_block_delay_reg_1_0 delay_reg_2
       (.clk(aclk_1),
        .tlast_in(delay_reg_1_tlast_out),
        .tlast_out(delay_reg_2_tlast_out),
        .tuser_in(delay_reg_1_tuser_out),
        .tuser_out(delay_reg_2_tuser_out),
        .tvalid_in(delay_reg_1_tvalid_out),
        .tvalid_out(delay_reg_2_tvalid_out));
  fft_module_block_delay_reg_2_0 delay_reg_3
       (.clk(aclk_1),
        .tlast_in(delay_reg_2_tlast_out),
        .tlast_out(delay_reg_3_tlast_out),
        .tuser_in(delay_reg_2_tuser_out),
        .tuser_out(delay_reg_3_tuser_out),
        .tvalid_in(delay_reg_2_tvalid_out),
        .tvalid_out(delay_reg_3_tvalid_out));
  fft_module_block_delay_reg_3_0 delay_reg_4
       (.clk(aclk_1),
        .tlast_in(delay_reg_3_tlast_out),
        .tlast_out(delay_reg_4_tlast_out),
        .tuser_in(delay_reg_3_tuser_out),
        .tuser_out(delay_reg_4_tuser_out),
        .tvalid_in(delay_reg_3_tvalid_out),
        .tvalid_out(delay_reg_4_tvalid_out));
  fft_module_block_mult_gen_0_0 mult_gen_0
       (.A(xlslice_0_Dout),
        .B(xlslice_0_Dout),
        .CLK(aclk_1),
        .P(mult_gen_0_P));
  fft_module_block_mult_gen_1_0 mult_gen_1
       (.A(xlslice_1_Dout),
        .B(xlslice_1_Dout),
        .CLK(aclk_1),
        .P(mult_gen_1_P));
  fft_module_block_xfft_0_0 xfft_0
       (.aclk(aclk_1),
        .m_axis_data_tdata(xfft_0_m_axis_data_tdata),
        .m_axis_data_tlast(xfft_0_M_AXIS_DATA_TLAST),
        .m_axis_data_tready(xfft_0_M_AXIS_DATA_TREADY),
        .m_axis_data_tuser(xfft_0_M_AXIS_DATA_TUSER),
        .m_axis_data_tvalid(xfft_0_M_AXIS_DATA_TVALID),
        .s_axis_config_tdata(xlconstant_1_dout),
        .s_axis_config_tvalid(xlconstant_0_dout),
        .s_axis_data_tdata(S_AXIS_DATA_1_TDATA),
        .s_axis_data_tlast(S_AXIS_DATA_1_TLAST),
        .s_axis_data_tready(S_AXIS_DATA_1_TREADY),
        .s_axis_data_tvalid(S_AXIS_DATA_1_TVALID));
  fft_module_block_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  fft_module_block_xlconstant_1_0 xlconstant_1
       (.dout(xlconstant_1_dout));
  fft_module_block_xlconstant_2_0 xlconstant_2
       (.dout(xlconstant_2_dout));
  fft_module_block_xlslice_0_0 xlslice_0
       (.Din(xfft_0_m_axis_data_tdata),
        .Dout(xlslice_0_Dout));
  fft_module_block_xlslice_1_0 xlslice_1
       (.Din(xfft_0_m_axis_data_tdata),
        .Dout(xlslice_1_Dout));
endmodule
