//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.2 (lin64) Build 1909853 Thu Jun 15 18:39:10 MDT 2017
//Date        : Sun Mar 11 19:16:31 2018
//Host        : ug237 running 64-bit Debian GNU/Linux 9.4 (stretch)
//Command     : generate_target mic_axis_block_wrapper.bd
//Design      : mic_axis_block_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mic_axis_block_wrapper
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
  wire [31:0]M04_AXIS_tdata;
  wire M04_AXIS_tlast;
  wire M04_AXIS_tready;
  wire [3:0]M04_AXIS_tstrb;
  wire M04_AXIS_tvalid;
  wire [31:0]M05_AXIS_tdata;
  wire M05_AXIS_tlast;
  wire M05_AXIS_tready;
  wire [3:0]M05_AXIS_tstrb;
  wire M05_AXIS_tvalid;
  wire [31:0]M06_AXIS_tdata;
  wire M06_AXIS_tlast;
  wire M06_AXIS_tready;
  wire [3:0]M06_AXIS_tstrb;
  wire M06_AXIS_tvalid;
  wire [31:0]M07_AXIS_tdata;
  wire M07_AXIS_tlast;
  wire M07_AXIS_tready;
  wire [3:0]M07_AXIS_tstrb;
  wire M07_AXIS_tvalid;
  wire [31:0]M08_AXIS_tdata;
  wire M08_AXIS_tlast;
  wire M08_AXIS_tready;
  wire [3:0]M08_AXIS_tstrb;
  wire M08_AXIS_tvalid;
  wire [31:0]M09_AXIS_tdata;
  wire M09_AXIS_tlast;
  wire M09_AXIS_tready;
  wire [3:0]M09_AXIS_tstrb;
  wire M09_AXIS_tvalid;
  wire [31:0]M10_AXIS_tdata;
  wire M10_AXIS_tlast;
  wire M10_AXIS_tready;
  wire [3:0]M10_AXIS_tstrb;
  wire M10_AXIS_tvalid;
  wire [31:0]M11_AXIS_tdata;
  wire M11_AXIS_tlast;
  wire M11_AXIS_tready;
  wire [3:0]M11_AXIS_tstrb;
  wire M11_AXIS_tvalid;
  wire [31:0]M12_AXIS_tdata;
  wire M12_AXIS_tlast;
  wire M12_AXIS_tready;
  wire [3:0]M12_AXIS_tstrb;
  wire M12_AXIS_tvalid;
  wire [31:0]M13_AXIS_tdata;
  wire M13_AXIS_tlast;
  wire M13_AXIS_tready;
  wire [3:0]M13_AXIS_tstrb;
  wire M13_AXIS_tvalid;
  wire [31:0]M14_AXIS_tdata;
  wire M14_AXIS_tlast;
  wire M14_AXIS_tready;
  wire [3:0]M14_AXIS_tstrb;
  wire M14_AXIS_tvalid;
  wire btn_d;
  wire clk;
  wire mic_clk_o;
  wire mic_data_i;
  wire mic_lrsel_o;
  wire resetn;

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
        .M04_AXIS_tdata(M04_AXIS_tdata),
        .M04_AXIS_tlast(M04_AXIS_tlast),
        .M04_AXIS_tready(M04_AXIS_tready),
        .M04_AXIS_tstrb(M04_AXIS_tstrb),
        .M04_AXIS_tvalid(M04_AXIS_tvalid),
        .M05_AXIS_tdata(M05_AXIS_tdata),
        .M05_AXIS_tlast(M05_AXIS_tlast),
        .M05_AXIS_tready(M05_AXIS_tready),
        .M05_AXIS_tstrb(M05_AXIS_tstrb),
        .M05_AXIS_tvalid(M05_AXIS_tvalid),
        .M06_AXIS_tdata(M06_AXIS_tdata),
        .M06_AXIS_tlast(M06_AXIS_tlast),
        .M06_AXIS_tready(M06_AXIS_tready),
        .M06_AXIS_tstrb(M06_AXIS_tstrb),
        .M06_AXIS_tvalid(M06_AXIS_tvalid),
        .M07_AXIS_tdata(M07_AXIS_tdata),
        .M07_AXIS_tlast(M07_AXIS_tlast),
        .M07_AXIS_tready(M07_AXIS_tready),
        .M07_AXIS_tstrb(M07_AXIS_tstrb),
        .M07_AXIS_tvalid(M07_AXIS_tvalid),
        .M08_AXIS_tdata(M08_AXIS_tdata),
        .M08_AXIS_tlast(M08_AXIS_tlast),
        .M08_AXIS_tready(M08_AXIS_tready),
        .M08_AXIS_tstrb(M08_AXIS_tstrb),
        .M08_AXIS_tvalid(M08_AXIS_tvalid),
        .M09_AXIS_tdata(M09_AXIS_tdata),
        .M09_AXIS_tlast(M09_AXIS_tlast),
        .M09_AXIS_tready(M09_AXIS_tready),
        .M09_AXIS_tstrb(M09_AXIS_tstrb),
        .M09_AXIS_tvalid(M09_AXIS_tvalid),
        .M10_AXIS_tdata(M10_AXIS_tdata),
        .M10_AXIS_tlast(M10_AXIS_tlast),
        .M10_AXIS_tready(M10_AXIS_tready),
        .M10_AXIS_tstrb(M10_AXIS_tstrb),
        .M10_AXIS_tvalid(M10_AXIS_tvalid),
        .M11_AXIS_tdata(M11_AXIS_tdata),
        .M11_AXIS_tlast(M11_AXIS_tlast),
        .M11_AXIS_tready(M11_AXIS_tready),
        .M11_AXIS_tstrb(M11_AXIS_tstrb),
        .M11_AXIS_tvalid(M11_AXIS_tvalid),
        .M12_AXIS_tdata(M12_AXIS_tdata),
        .M12_AXIS_tlast(M12_AXIS_tlast),
        .M12_AXIS_tready(M12_AXIS_tready),
        .M12_AXIS_tstrb(M12_AXIS_tstrb),
        .M12_AXIS_tvalid(M12_AXIS_tvalid),
        .M13_AXIS_tdata(M13_AXIS_tdata),
        .M13_AXIS_tlast(M13_AXIS_tlast),
        .M13_AXIS_tready(M13_AXIS_tready),
        .M13_AXIS_tstrb(M13_AXIS_tstrb),
        .M13_AXIS_tvalid(M13_AXIS_tvalid),
        .M14_AXIS_tdata(M14_AXIS_tdata),
        .M14_AXIS_tlast(M14_AXIS_tlast),
        .M14_AXIS_tready(M14_AXIS_tready),
        .M14_AXIS_tstrb(M14_AXIS_tstrb),
        .M14_AXIS_tvalid(M14_AXIS_tvalid),
        .btn_d(btn_d),
        .clk(clk),
        .mic_clk_o(mic_clk_o),
        .mic_data_i(mic_data_i),
        .mic_lrsel_o(mic_lrsel_o),
        .resetn(resetn));
endmodule
