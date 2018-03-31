set_property -dict {PACKAGE_PIN D5 IOSTANDARD LVCMOS33} [get_ports eth_ref_clk]

set_property IOSTANDARD LVCMOS33 [get_ports mic_clk_o]
set_property IOSTANDARD LVCMOS33 [get_ports mic_data_i]
set_property IOSTANDARD LVCMOS33 [get_ports mic_lrsel_o]
set_property PACKAGE_PIN J5 [get_ports mic_clk_o]
set_property PACKAGE_PIN H5 [get_ports mic_data_i]
set_property PACKAGE_PIN F5 [get_ports mic_lrsel_o]

set_property IOSTANDARD LVCMOS33 [get_ports btn_d]
set_property PACKAGE_PIN P18 [get_ports btn_d]

