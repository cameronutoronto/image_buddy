
`timescale 1 ns / 1 ps

	module mic_axis_ip_v1_0 #
	(
		// Users to add parameters here
        parameter integer NUM_BITS = 8,
        parameter integer CLK_BITS = 4,
        parameter integer STRM_COUNT_BITS = 14,
        parameter integer NUM_CHUNK_BITS = 8,

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Master Bus Interface M00_AXIS
		parameter integer C_M00_AXIS_TDATA_WIDTH	= 16,
		parameter integer C_M00_AXIS_START_COUNT	= 32
	)
	(
		// Users to add ports here
            
        output wire mic_clk_o,
        input wire mic_data_i,
        output wire mic_lrsel_o,
        
        input wire btn_d,

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Master Bus Interface M00_AXIS
		input wire  m00_axis_aclk,
		input wire  m00_axis_aresetn,
		output wire  m00_axis_tvalid,
		output wire [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		output wire [(C_M00_AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tstrb,
		output wire  m00_axis_tlast,
		input wire  m00_axis_tready
	);
// Instantiation of Axi Bus Interface M00_AXIS
	mic_axis_ip_v1_0_M00_AXIS # ( 
	    .NUM_BITS(NUM_BITS),
	    .CLK_BITS(CLK_BITS),
	    .STRM_COUNT_BITS(STRM_COUNT_BITS),
	    .NUM_CHUNK_BITS(NUM_CHUNK_BITS),
		.C_M_AXIS_TDATA_WIDTH(C_M00_AXIS_TDATA_WIDTH),
		.C_M_START_COUNT(C_M00_AXIS_START_COUNT)
	) mic_axis_ip_v1_0_M00_AXIS_inst (
        .mic_clk_o(mic_clk_o),
        .mic_data_i(mic_data_i),
        .mic_lrsel_o(mic_lrsel_o),
        .btn_d(btn_d),
		.M_AXIS_ACLK(m00_axis_aclk),
		.M_AXIS_ARESETN(m00_axis_aresetn),
		.M_AXIS_TVALID(m00_axis_tvalid),
		.M_AXIS_TDATA(m00_axis_tdata),
		.M_AXIS_TSTRB(m00_axis_tstrb),
		.M_AXIS_TLAST(m00_axis_tlast),
		.M_AXIS_TREADY(m00_axis_tready)
	);

	// Add user logic here

	// User logic ends

	endmodule
