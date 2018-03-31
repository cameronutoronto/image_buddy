
################################################################
# This is a generated script based on design: design_top
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2017.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source build_top.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# accumulate15, accumulate15, accumulate15, accumulate15, accumulate15, accumulate15, accumulate15, accumulate15, accumulate15, accumulate15, accumulate15, accumulate15, accumulate15, axis_interconnect_v11, deriv_maker, deriv_maker, deriv_maker, deriv_maker, deriv_maker, deriv_maker, deriv_maker, deriv_maker, deriv_maker, deriv_maker, deriv_maker, deriv_maker, deriv_maker, get_values, logarithm, slicer15

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a100tcsg324-1
   set_property BOARD_PART digilentinc.com:nexys4_ddr:part0:1.1 [current_project]
}


# CHANGE DESIGN NAME HERE
set design_name design_top

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################

proc write_mig_file { str_mig_prj_filepath } {

  set mig_prj_file [open $str_mig_prj_filepath w+]

  puts $mig_prj_file {<?xml version='1.0' encoding='UTF-8'?>}
  puts $mig_prj_file {<!-- IMPORTANT: This is an internal file that has been generated by the MIG software. Any direct editing or changes made to this file may result in unpredictable behavior or data corruption. It is strongly advised that users do not edit the contents of this file. Re-run the MIG GUI with the required settings if any of the options provided below need to be altered. -->}
  puts $mig_prj_file {<Project NoOfControllers="1" >}
  puts $mig_prj_file {    <ModuleName>design_1_mig_7series_0_2</ModuleName>}
  puts $mig_prj_file {    <dci_inouts_inputs>1</dci_inouts_inputs>}
  puts $mig_prj_file {    <dci_inputs>1</dci_inputs>}
  puts $mig_prj_file {    <Debug_En>OFF</Debug_En>}
  puts $mig_prj_file {    <DataDepth_En>1024</DataDepth_En>}
  puts $mig_prj_file {    <LowPower_En>ON</LowPower_En>}
  puts $mig_prj_file {    <XADC_En>Enabled</XADC_En>}
  puts $mig_prj_file {    <TargetFPGA>xc7a100t-csg324/-1</TargetFPGA>}
  puts $mig_prj_file {    <Version>2.2</Version>}
  puts $mig_prj_file {    <SystemClock>No Buffer</SystemClock>}
  puts $mig_prj_file {    <ReferenceClock>Use System Clock</ReferenceClock>}
  puts $mig_prj_file {    <SysResetPolarity>ACTIVE LOW</SysResetPolarity>}
  puts $mig_prj_file {    <BankSelectionFlag>FALSE</BankSelectionFlag>}
  puts $mig_prj_file {    <InternalVref>1</InternalVref>}
  puts $mig_prj_file {    <dci_hr_inouts_inputs>50 Ohms</dci_hr_inouts_inputs>}
  puts $mig_prj_file {    <dci_cascade>0</dci_cascade>}
  puts $mig_prj_file {    <Controller number="0" >}
  puts $mig_prj_file {        <MemoryDevice>DDR2_SDRAM/Components/MT47H64M16HR-25E</MemoryDevice>}
  puts $mig_prj_file {        <TimePeriod>3077</TimePeriod>}
  puts $mig_prj_file {        <VccAuxIO>1.8V</VccAuxIO>}
  puts $mig_prj_file {        <PHYRatio>4:1</PHYRatio>}
  puts $mig_prj_file {        <InputClkFreq>199.995</InputClkFreq>}
  puts $mig_prj_file {        <UIExtraClocks>1</UIExtraClocks>}
  puts $mig_prj_file {		<MMCM_VCO>1200</MMCM_VCO>}
  puts $mig_prj_file {        <MMCMClkOut0>12.000</MMCMClkOut0>}
  puts $mig_prj_file {        <MMCMClkOut1>1</MMCMClkOut1>}
  puts $mig_prj_file {        <MMCMClkOut2>1</MMCMClkOut2>}
  puts $mig_prj_file {        <MMCMClkOut3>1</MMCMClkOut3>}
  puts $mig_prj_file {        <MMCMClkOut4>1</MMCMClkOut4>}
  puts $mig_prj_file {        <DataWidth>16</DataWidth>}
  puts $mig_prj_file {        <DeepMemory>1</DeepMemory>}
  puts $mig_prj_file {        <DataMask>1</DataMask>}
  puts $mig_prj_file {        <ECC>Disabled</ECC>}
  puts $mig_prj_file {        <Ordering>Normal</Ordering>}
  puts $mig_prj_file {        <CustomPart>FALSE</CustomPart>}
  puts $mig_prj_file {        <NewPartName></NewPartName>}
  puts $mig_prj_file {        <RowAddress>13</RowAddress>}
  puts $mig_prj_file {        <ColAddress>10</ColAddress>}
  puts $mig_prj_file {        <BankAddress>3</BankAddress>}
  puts $mig_prj_file {        <C0_MEM_SIZE>134217728</C0_MEM_SIZE>}
  puts $mig_prj_file {        <UserMemoryAddressMap>BANK_ROW_COLUMN</UserMemoryAddressMap>}
  puts $mig_prj_file {        <PinSelection>}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="M4" SLEW="" name="ddr2_addr[0]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="R2" SLEW="" name="ddr2_addr[10]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="K5" SLEW="" name="ddr2_addr[11]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="N6" SLEW="" name="ddr2_addr[12]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="P4" SLEW="" name="ddr2_addr[1]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="M6" SLEW="" name="ddr2_addr[2]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="T1" SLEW="" name="ddr2_addr[3]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="L3" SLEW="" name="ddr2_addr[4]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="P5" SLEW="" name="ddr2_addr[5]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="M2" SLEW="" name="ddr2_addr[6]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="N1" SLEW="" name="ddr2_addr[7]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="L4" SLEW="" name="ddr2_addr[8]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="N5" SLEW="" name="ddr2_addr[9]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="P2" SLEW="" name="ddr2_ba[0]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="P3" SLEW="" name="ddr2_ba[1]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="R1" SLEW="" name="ddr2_ba[2]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="L1" SLEW="" name="ddr2_cas_n" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL18_II" PADName="L5" SLEW="" name="ddr2_ck_n[0]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL18_II" PADName="L6" SLEW="" name="ddr2_ck_p[0]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="M1" SLEW="" name="ddr2_cke[0]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="K6" SLEW="" name="ddr2_cs_n[0]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="T6" SLEW="" name="ddr2_dm[0]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="U1" SLEW="" name="ddr2_dm[1]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="R7" SLEW="" name="ddr2_dq[0]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="V5" SLEW="" name="ddr2_dq[10]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="U4" SLEW="" name="ddr2_dq[11]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="V4" SLEW="" name="ddr2_dq[12]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="T4" SLEW="" name="ddr2_dq[13]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="V1" SLEW="" name="ddr2_dq[14]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="T3" SLEW="" name="ddr2_dq[15]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="V6" SLEW="" name="ddr2_dq[1]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="R8" SLEW="" name="ddr2_dq[2]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="U7" SLEW="" name="ddr2_dq[3]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="V7" SLEW="" name="ddr2_dq[4]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="R6" SLEW="" name="ddr2_dq[5]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="U6" SLEW="" name="ddr2_dq[6]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="R5" SLEW="" name="ddr2_dq[7]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="T5" SLEW="" name="ddr2_dq[8]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="U3" SLEW="" name="ddr2_dq[9]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL18_II" PADName="V9" SLEW="" name="ddr2_dqs_n[0]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL18_II" PADName="V2" SLEW="" name="ddr2_dqs_n[1]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL18_II" PADName="U9" SLEW="" name="ddr2_dqs_p[0]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="DIFF_SSTL18_II" PADName="U2" SLEW="" name="ddr2_dqs_p[1]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="M3" SLEW="" name="ddr2_odt[0]" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="N4" SLEW="" name="ddr2_ras_n" IN_TERM="" />}
  puts $mig_prj_file {            <Pin VCCAUX_IO="" IOSTANDARD="SSTL18_II" PADName="N2" SLEW="" name="ddr2_we_n" IN_TERM="" />}
  puts $mig_prj_file {        </PinSelection>}
  puts $mig_prj_file {        <System_Control>}
  puts $mig_prj_file {            <Pin PADName="No connect" Bank="Select Bank" name="sys_rst" />}
  puts $mig_prj_file {            <Pin PADName="No connect" Bank="Select Bank" name="init_calib_complete" />}
  puts $mig_prj_file {            <Pin PADName="No connect" Bank="Select Bank" name="tg_compare_error" />}
  puts $mig_prj_file {        </System_Control>}
  puts $mig_prj_file {        <TimingParameters>}
  puts $mig_prj_file {            <Parameters twtr="7.5" trrd="10" trefi="7.8" tfaw="45" trtp="7.5" trfc="127.5" trp="12.5" tras="40" trcd="15" />}
  puts $mig_prj_file {        </TimingParameters>}
  puts $mig_prj_file {        <mrBurstLength name="Burst Length" >8</mrBurstLength>}
  puts $mig_prj_file {        <mrBurstType name="Burst Type" >Sequential</mrBurstType>}
  puts $mig_prj_file {        <mrCasLatency name="CAS Latency" >5</mrCasLatency>}
  puts $mig_prj_file {        <mrMode name="Mode" >Normal</mrMode>}
  puts $mig_prj_file {        <mrDllReset name="DLL Reset" >No</mrDllReset>}
  puts $mig_prj_file {        <mrPdMode name="PD Mode" >Fast exit</mrPdMode>}
  puts $mig_prj_file {        <mrWriteRecovery name="Write Recovery" >5</mrWriteRecovery>}
  puts $mig_prj_file {        <emrDllEnable name="DLL Enable" >Enable-Normal</emrDllEnable>}
  puts $mig_prj_file {        <emrOutputDriveStrength name="Output Drive Strength" >Fullstrength</emrOutputDriveStrength>}
  puts $mig_prj_file {        <emrCSSelection name="Controller Chip Select Pin" >Enable</emrCSSelection>}
  puts $mig_prj_file {        <emrCKSelection name="Memory Clock Selection" >1</emrCKSelection>}
  puts $mig_prj_file {        <emrRTT name="RTT (nominal) - ODT" >50ohms</emrRTT>}
  puts $mig_prj_file {        <emrPosted name="Additive Latency (AL)" >0</emrPosted>}
  puts $mig_prj_file {        <emrOCD name="OCD Operation" >OCD Exit</emrOCD>}
  puts $mig_prj_file {        <emrDQS name="DQS# Enable" >Enable</emrDQS>}
  puts $mig_prj_file {        <emrRDQS name="RDQS Enable" >Disable</emrRDQS>}
  puts $mig_prj_file {        <emrOutputs name="Outputs" >Enable</emrOutputs>}
  puts $mig_prj_file {        <PortInterface>AXI</PortInterface>}
  puts $mig_prj_file {        <AXIParameters>}
  puts $mig_prj_file {            <C0_C_RD_WR_ARB_ALGORITHM>RD_PRI_REG</C0_C_RD_WR_ARB_ALGORITHM>}
  puts $mig_prj_file {            <C0_S_AXI_ADDR_WIDTH>27</C0_S_AXI_ADDR_WIDTH>}
  puts $mig_prj_file {            <C0_S_AXI_DATA_WIDTH>64</C0_S_AXI_DATA_WIDTH>}
  puts $mig_prj_file {            <C0_S_AXI_ID_WIDTH>1</C0_S_AXI_ID_WIDTH>}
  puts $mig_prj_file {            <C0_S_AXI_SUPPORTS_NARROW_BURST>0</C0_S_AXI_SUPPORTS_NARROW_BURST>}
  puts $mig_prj_file {        </AXIParameters>}
  puts $mig_prj_file {    </Controller>}
  puts $mig_prj_file {</Project>}

  close $mig_prj_file
}


# Hierarchical cell: microblaze_0_local_memory
proc create_hier_cell_microblaze_0_local_memory { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_microblaze_0_local_memory() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB

  # Create pins
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -type rst SYS_Rst

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_ECC {0} \
 ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_ECC {0} \
 ] $ilmb_bram_if_cntlr

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 lmb_bram ]
  set_property -dict [ list \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.use_bram_block {BRAM_Controller} \
 ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net SYS_Rst_1 [get_bd_pins SYS_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_v10/LMB_Clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR2 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR2 ]
  set eth_mdio_mdc [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:mdio_rtl:1.0 eth_mdio_mdc ]
  set eth_rmii [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:rmii_rtl:1.0 eth_rmii ]
  set ja [ create_bd_intf_port -mode Master -vlnv digilentinc.com:interface:pmod_rtl:1.0 ja ]
  set usb_uart [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 usb_uart ]

  # Create ports
  set btn_d [ create_bd_port -dir I btn_d ]
  set eth_ref_clk [ create_bd_port -dir O -type clk eth_ref_clk ]
  set mic_clk_o [ create_bd_port -dir O mic_clk_o ]
  set mic_data_i [ create_bd_port -dir I mic_data_i ]
  set mic_lrsel_o [ create_bd_port -dir O mic_lrsel_o ]
  set reset [ create_bd_port -dir I -type rst reset ]
  set_property -dict [ list \
CONFIG.POLARITY {ACTIVE_LOW} \
 ] $reset
  set sys_clock [ create_bd_port -dir I -type clk sys_clock ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {100000000} \
CONFIG.PHASE {0.000} \
 ] $sys_clock

  # Create instance: PmodOLEDrgb_0, and set properties
  set PmodOLEDrgb_0 [ create_bd_cell -type ip -vlnv digilentinc.com:IP:PmodOLEDrgb:1.0 PmodOLEDrgb_0 ]
  set_property -dict [ list \
CONFIG.PMOD {ja} \
 ] $PmodOLEDrgb_0

  # Create instance: accumulate15_0, and set properties
  set block_name accumulate15
  set block_cell_name accumulate15_0
  if { [catch {set accumulate15_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $accumulate15_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: accumulate15_1, and set properties
  set block_name accumulate15
  set block_cell_name accumulate15_1
  if { [catch {set accumulate15_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $accumulate15_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: accumulate15_2, and set properties
  set block_name accumulate15
  set block_cell_name accumulate15_2
  if { [catch {set accumulate15_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $accumulate15_2 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: accumulate15_3, and set properties
  set block_name accumulate15
  set block_cell_name accumulate15_3
  if { [catch {set accumulate15_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $accumulate15_3 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: accumulate15_4, and set properties
  set block_name accumulate15
  set block_cell_name accumulate15_4
  if { [catch {set accumulate15_4 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $accumulate15_4 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: accumulate15_5, and set properties
  set block_name accumulate15
  set block_cell_name accumulate15_5
  if { [catch {set accumulate15_5 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $accumulate15_5 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: accumulate15_6, and set properties
  set block_name accumulate15
  set block_cell_name accumulate15_6
  if { [catch {set accumulate15_6 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $accumulate15_6 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: accumulate15_7, and set properties
  set block_name accumulate15
  set block_cell_name accumulate15_7
  if { [catch {set accumulate15_7 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $accumulate15_7 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: accumulate15_8, and set properties
  set block_name accumulate15
  set block_cell_name accumulate15_8
  if { [catch {set accumulate15_8 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $accumulate15_8 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: accumulate15_9, and set properties
  set block_name accumulate15
  set block_cell_name accumulate15_9
  if { [catch {set accumulate15_9 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $accumulate15_9 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: accumulate15_10, and set properties
  set block_name accumulate15
  set block_cell_name accumulate15_10
  if { [catch {set accumulate15_10 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $accumulate15_10 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: accumulate15_11, and set properties
  set block_name accumulate15
  set block_cell_name accumulate15_11
  if { [catch {set accumulate15_11 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $accumulate15_11 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: accumulate15_12, and set properties
  set block_name accumulate15
  set block_cell_name accumulate15_12
  if { [catch {set accumulate15_12 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $accumulate15_12 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: axi_ethernetlite_0, and set properties
  set axi_ethernetlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_ethernetlite:3.0 axi_ethernetlite_0 ]
  set_property -dict [ list \
CONFIG.MDIO_BOARD_INTERFACE {eth_mdio_mdc} \
CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_ethernetlite_0

  # Create instance: axi_smc, and set properties
  set axi_smc [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 axi_smc ]
  set_property -dict [ list \
CONFIG.NUM_CLKS {2} \
CONFIG.NUM_SI {2} \
 ] $axi_smc

  # Create instance: axi_timer_0, and set properties
  set axi_timer_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 axi_timer_0 ]

  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]
  set_property -dict [ list \
CONFIG.UARTLITE_BOARD_INTERFACE {usb_uart} \
CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_uartlite_0

  # Create instance: axis_cep_fifo_0, and set properties
  set axis_cep_fifo_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_cep_fifo_0 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_cep_fifo_0

  # Create instance: axis_cep_fifo_1, and set properties
  set axis_cep_fifo_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_cep_fifo_1 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_cep_fifo_1

  # Create instance: axis_cep_fifo_2, and set properties
  set axis_cep_fifo_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_cep_fifo_2 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_cep_fifo_2

  # Create instance: axis_cep_fifo_3, and set properties
  set axis_cep_fifo_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_cep_fifo_3 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_cep_fifo_3

  # Create instance: axis_cep_fifo_4, and set properties
  set axis_cep_fifo_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_cep_fifo_4 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_cep_fifo_4

  # Create instance: axis_cep_fifo_5, and set properties
  set axis_cep_fifo_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_cep_fifo_5 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_cep_fifo_5

  # Create instance: axis_cep_fifo_6, and set properties
  set axis_cep_fifo_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_cep_fifo_6 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_cep_fifo_6

  # Create instance: axis_cep_fifo_7, and set properties
  set axis_cep_fifo_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_cep_fifo_7 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_cep_fifo_7

  # Create instance: axis_cep_fifo_8, and set properties
  set axis_cep_fifo_8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_cep_fifo_8 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_cep_fifo_8

  # Create instance: axis_cep_fifo_9, and set properties
  set axis_cep_fifo_9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_cep_fifo_9 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_cep_fifo_9

  # Create instance: axis_cep_fifo_10, and set properties
  set axis_cep_fifo_10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_cep_fifo_10 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_cep_fifo_10

  # Create instance: axis_cep_fifo_11, and set properties
  set axis_cep_fifo_11 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_cep_fifo_11 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_cep_fifo_11

  # Create instance: axis_cep_fifo_12, and set properties
  set axis_cep_fifo_12 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_cep_fifo_12 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_cep_fifo_12

  # Create instance: axis_data_fifo_1, and set properties
  set axis_data_fifo_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_1 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {64} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_1

  # Create instance: axis_data_fifo_2, and set properties
  set axis_data_fifo_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_2 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {64} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_2

  # Create instance: axis_data_fifo_3, and set properties
  set axis_data_fifo_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_3 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {64} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_3

  # Create instance: axis_data_fifo_4, and set properties
  set axis_data_fifo_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_4 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {64} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_4

  # Create instance: axis_data_fifo_5, and set properties
  set axis_data_fifo_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_5 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {64} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_5

  # Create instance: axis_data_fifo_6, and set properties
  set axis_data_fifo_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_6 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {64} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_6

  # Create instance: axis_data_fifo_7, and set properties
  set axis_data_fifo_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_7 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {64} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_7

  # Create instance: axis_data_fifo_8, and set properties
  set axis_data_fifo_8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_8 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {64} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_8

  # Create instance: axis_data_fifo_9, and set properties
  set axis_data_fifo_9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_9 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {64} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_9

  # Create instance: axis_data_fifo_10, and set properties
  set axis_data_fifo_10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_10 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {64} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_10

  # Create instance: axis_data_fifo_11, and set properties
  set axis_data_fifo_11 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_11 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {64} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_11

  # Create instance: axis_data_fifo_12, and set properties
  set axis_data_fifo_12 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_12 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {64} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_12

  # Create instance: axis_data_fifo_13, and set properties
  set axis_data_fifo_13 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_13 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {64} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_13

  # Create instance: axis_data_fifo_14, and set properties
  set axis_data_fifo_14 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_14 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {64} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_14

  # Create instance: axis_data_fifo_15, and set properties
  set axis_data_fifo_15 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_15 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {64} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_15

  # Create instance: axis_interconnect_v11_0, and set properties
  set block_name axis_interconnect_v11
  set block_cell_name axis_interconnect_v11_0
  if { [catch {set axis_interconnect_v11_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axis_interconnect_v11_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: clk_wiz_1, and set properties
  set clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.4 clk_wiz_1 ]
  set_property -dict [ list \
CONFIG.CLKOUT2_JITTER {114.829} \
CONFIG.CLKOUT2_PHASE_ERROR {98.575} \
CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {200.000} \
CONFIG.CLKOUT2_USED {true} \
CONFIG.CLKOUT3_JITTER {151.636} \
CONFIG.CLKOUT3_PHASE_ERROR {98.575} \
CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {50.000} \
CONFIG.CLKOUT3_USED {true} \
CONFIG.CLK_IN1_BOARD_INTERFACE {sys_clock} \
CONFIG.MMCM_CLKOUT1_DIVIDE {5} \
CONFIG.MMCM_CLKOUT2_DIVIDE {20} \
CONFIG.MMCM_DIVCLK_DIVIDE {1} \
CONFIG.NUM_OUT_CLKS {3} \
CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
CONFIG.RESET_BOARD_INTERFACE {reset} \
CONFIG.RESET_PORT {resetn} \
CONFIG.RESET_TYPE {ACTIVE_LOW} \
CONFIG.USE_BOARD_FLOW {true} \
 ] $clk_wiz_1

  # Create instance: deriv_maker_0, and set properties
  set block_name deriv_maker
  set block_cell_name deriv_maker_0
  if { [catch {set deriv_maker_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $deriv_maker_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: deriv_maker_1, and set properties
  set block_name deriv_maker
  set block_cell_name deriv_maker_1
  if { [catch {set deriv_maker_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $deriv_maker_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: deriv_maker_2, and set properties
  set block_name deriv_maker
  set block_cell_name deriv_maker_2
  if { [catch {set deriv_maker_2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $deriv_maker_2 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: deriv_maker_3, and set properties
  set block_name deriv_maker
  set block_cell_name deriv_maker_3
  if { [catch {set deriv_maker_3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $deriv_maker_3 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: deriv_maker_4, and set properties
  set block_name deriv_maker
  set block_cell_name deriv_maker_4
  if { [catch {set deriv_maker_4 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $deriv_maker_4 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: deriv_maker_5, and set properties
  set block_name deriv_maker
  set block_cell_name deriv_maker_5
  if { [catch {set deriv_maker_5 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $deriv_maker_5 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: deriv_maker_6, and set properties
  set block_name deriv_maker
  set block_cell_name deriv_maker_6
  if { [catch {set deriv_maker_6 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $deriv_maker_6 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: deriv_maker_7, and set properties
  set block_name deriv_maker
  set block_cell_name deriv_maker_7
  if { [catch {set deriv_maker_7 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $deriv_maker_7 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: deriv_maker_8, and set properties
  set block_name deriv_maker
  set block_cell_name deriv_maker_8
  if { [catch {set deriv_maker_8 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $deriv_maker_8 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: deriv_maker_9, and set properties
  set block_name deriv_maker
  set block_cell_name deriv_maker_9
  if { [catch {set deriv_maker_9 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $deriv_maker_9 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: deriv_maker_10, and set properties
  set block_name deriv_maker
  set block_cell_name deriv_maker_10
  if { [catch {set deriv_maker_10 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $deriv_maker_10 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: deriv_maker_11, and set properties
  set block_name deriv_maker
  set block_cell_name deriv_maker_11
  if { [catch {set deriv_maker_11 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $deriv_maker_11 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: deriv_maker_12, and set properties
  set block_name deriv_maker
  set block_cell_name deriv_maker_12
  if { [catch {set deriv_maker_12 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $deriv_maker_12 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: get_values_0, and set properties
  set block_name get_values
  set block_cell_name get_values_0
  if { [catch {set get_values_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $get_values_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: logarithm_0, and set properties
  set block_name logarithm
  set block_cell_name logarithm_0
  if { [catch {set logarithm_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $logarithm_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]

  # Create instance: mic_axis_block_wrapper_0, and set properties
  set mic_axis_block_wrapper_0 [ create_bd_cell -type ip -vlnv user.org:user:mic_axis_block_wrapper:1.0 mic_axis_block_wrapper_0 ]

  # Create instance: microblaze_0, and set properties
  set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:10.0 microblaze_0 ]
  set_property -dict [ list \
CONFIG.C_CACHE_BYTE_SIZE {16384} \
CONFIG.C_DCACHE_BYTE_SIZE {16384} \
CONFIG.C_DEBUG_ENABLED {1} \
CONFIG.C_D_AXI {1} \
CONFIG.C_D_LMB {1} \
CONFIG.C_FSL_LINKS {14} \
CONFIG.C_I_LMB {1} \
CONFIG.C_USE_DCACHE {1} \
CONFIG.C_USE_ICACHE {1} \
 ] $microblaze_0

  # Create instance: microblaze_0_axi_intc, and set properties
  set microblaze_0_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_0_axi_intc ]
  set_property -dict [ list \
CONFIG.C_HAS_FAST {1} \
 ] $microblaze_0_axi_intc

  # Create instance: microblaze_0_axi_periph, and set properties
  set microblaze_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_0_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {6} \
 ] $microblaze_0_axi_periph

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory [current_bd_instance .] microblaze_0_local_memory

  # Create instance: microblaze_0_xlconcat, and set properties
  set microblaze_0_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_0_xlconcat ]

  # Create instance: mig_7series_0, and set properties
  set mig_7series_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mig_7series:4.0 mig_7series_0 ]
  
    # Generate the PRJ File for MIG
  set str_mig_folder [get_property IP_DIR [ get_ips [ get_property CONFIG.Component_Name $mig_7series_0 ] ] ]
  set str_mig_file_name mig_a.prj
  set str_mig_file_path ${str_mig_folder}/${str_mig_file_name}

  write_mig_file $str_mig_file_path
  
  set_property -dict [ list \
CONFIG.RESET_BOARD_INTERFACE {reset} \
CONFIG.XML_INPUT_FILE {mig_a.prj} \
 ] $mig_7series_0

  # Create instance: mii_to_rmii_0, and set properties
  set mii_to_rmii_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mii_to_rmii:2.0 mii_to_rmii_0 ]
  set_property -dict [ list \
CONFIG.RESET_BOARD_INTERFACE {reset} \
CONFIG.RMII_BOARD_INTERFACE {eth_rmii} \
 ] $mii_to_rmii_0

  # Create instance: mult_gen_0, and set properties
  set mult_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_0 ]
  set_property -dict [ list \
CONFIG.Multiplier_Construction {Use_Mults} \
CONFIG.OutputWidthHigh {31} \
CONFIG.PipeStages {3} \
CONFIG.PortAType {Unsigned} \
CONFIG.PortAWidth {16} \
CONFIG.PortBType {Signed} \
CONFIG.PortBWidth {12} \
CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_0

  # Create instance: mult_gen_1, and set properties
  set mult_gen_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_1 ]
  set_property -dict [ list \
CONFIG.Multiplier_Construction {Use_Mults} \
CONFIG.OutputWidthHigh {31} \
CONFIG.PipeStages {3} \
CONFIG.PortAType {Unsigned} \
CONFIG.PortAWidth {16} \
CONFIG.PortBType {Signed} \
CONFIG.PortBWidth {12} \
CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_1

  # Create instance: mult_gen_2, and set properties
  set mult_gen_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_2 ]
  set_property -dict [ list \
CONFIG.Multiplier_Construction {Use_Mults} \
CONFIG.OutputWidthHigh {31} \
CONFIG.PipeStages {3} \
CONFIG.PortAType {Unsigned} \
CONFIG.PortAWidth {16} \
CONFIG.PortBType {Signed} \
CONFIG.PortBWidth {12} \
CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_2

  # Create instance: mult_gen_3, and set properties
  set mult_gen_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_3 ]
  set_property -dict [ list \
CONFIG.Multiplier_Construction {Use_Mults} \
CONFIG.OutputWidthHigh {31} \
CONFIG.PipeStages {3} \
CONFIG.PortAType {Unsigned} \
CONFIG.PortAWidth {16} \
CONFIG.PortBType {Signed} \
CONFIG.PortBWidth {12} \
CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_3

  # Create instance: mult_gen_4, and set properties
  set mult_gen_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_4 ]
  set_property -dict [ list \
CONFIG.Multiplier_Construction {Use_Mults} \
CONFIG.OutputWidthHigh {31} \
CONFIG.PipeStages {3} \
CONFIG.PortAType {Unsigned} \
CONFIG.PortAWidth {16} \
CONFIG.PortBType {Signed} \
CONFIG.PortBWidth {12} \
CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_4

  # Create instance: mult_gen_5, and set properties
  set mult_gen_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_5 ]
  set_property -dict [ list \
CONFIG.Multiplier_Construction {Use_Mults} \
CONFIG.OutputWidthHigh {31} \
CONFIG.PipeStages {3} \
CONFIG.PortAType {Unsigned} \
CONFIG.PortAWidth {16} \
CONFIG.PortBType {Signed} \
CONFIG.PortBWidth {12} \
CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_5

  # Create instance: mult_gen_6, and set properties
  set mult_gen_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_6 ]
  set_property -dict [ list \
CONFIG.Multiplier_Construction {Use_Mults} \
CONFIG.OutputWidthHigh {31} \
CONFIG.PipeStages {3} \
CONFIG.PortAType {Unsigned} \
CONFIG.PortAWidth {16} \
CONFIG.PortBType {Signed} \
CONFIG.PortBWidth {12} \
CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_6

  # Create instance: mult_gen_7, and set properties
  set mult_gen_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_7 ]
  set_property -dict [ list \
CONFIG.Multiplier_Construction {Use_Mults} \
CONFIG.OutputWidthHigh {31} \
CONFIG.PipeStages {3} \
CONFIG.PortAType {Unsigned} \
CONFIG.PortAWidth {16} \
CONFIG.PortBType {Signed} \
CONFIG.PortBWidth {12} \
CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_7

  # Create instance: mult_gen_8, and set properties
  set mult_gen_8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_8 ]
  set_property -dict [ list \
CONFIG.Multiplier_Construction {Use_Mults} \
CONFIG.OutputWidthHigh {31} \
CONFIG.PipeStages {3} \
CONFIG.PortAType {Unsigned} \
CONFIG.PortAWidth {16} \
CONFIG.PortBType {Signed} \
CONFIG.PortBWidth {12} \
CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_8

  # Create instance: mult_gen_9, and set properties
  set mult_gen_9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_9 ]
  set_property -dict [ list \
CONFIG.Multiplier_Construction {Use_Mults} \
CONFIG.OutputWidthHigh {31} \
CONFIG.PipeStages {3} \
CONFIG.PortAType {Unsigned} \
CONFIG.PortAWidth {16} \
CONFIG.PortBType {Signed} \
CONFIG.PortBWidth {12} \
CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_9

  # Create instance: mult_gen_10, and set properties
  set mult_gen_10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_10 ]
  set_property -dict [ list \
CONFIG.Multiplier_Construction {Use_Mults} \
CONFIG.OutputWidthHigh {31} \
CONFIG.PipeStages {3} \
CONFIG.PortAType {Unsigned} \
CONFIG.PortAWidth {16} \
CONFIG.PortBType {Signed} \
CONFIG.PortBWidth {12} \
CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_10

  # Create instance: mult_gen_11, and set properties
  set mult_gen_11 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_11 ]
  set_property -dict [ list \
CONFIG.Multiplier_Construction {Use_Mults} \
CONFIG.OutputWidthHigh {31} \
CONFIG.PipeStages {3} \
CONFIG.PortAType {Unsigned} \
CONFIG.PortAWidth {16} \
CONFIG.PortBType {Signed} \
CONFIG.PortBWidth {12} \
CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_11

  # Create instance: mult_gen_12, and set properties
  set mult_gen_12 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mult_gen:12.0 mult_gen_12 ]
  set_property -dict [ list \
CONFIG.Multiplier_Construction {Use_Mults} \
CONFIG.OutputWidthHigh {31} \
CONFIG.PipeStages {3} \
CONFIG.PortAType {Unsigned} \
CONFIG.PortAWidth {16} \
CONFIG.PortBType {Signed} \
CONFIG.PortBWidth {12} \
CONFIG.Use_Custom_Output_Width {true} \
 ] $mult_gen_12

  # Create instance: rst_clk_wiz_1_100M, and set properties
  set rst_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_1_100M ]
  set_property -dict [ list \
CONFIG.RESET_BOARD_INTERFACE {reset} \
CONFIG.USE_BOARD_FLOW {true} \
 ] $rst_clk_wiz_1_100M

  # Create instance: rst_mig_7series_0_81M, and set properties
  set rst_mig_7series_0_81M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_mig_7series_0_81M ]

  # Create instance: slicer15_0, and set properties
  set block_name slicer15
  set block_cell_name slicer15_0
  if { [catch {set slicer15_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $slicer15_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: valid_concat, and set properties
  set valid_concat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 valid_concat ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {15} \
 ] $valid_concat

  # Create interface connections
  connect_bd_intf_net -intf_net PmodOLEDrgb_0_PmodOLEDrgb_out [get_bd_intf_ports ja] [get_bd_intf_pins PmodOLEDrgb_0/PmodOLEDrgb_out]
  connect_bd_intf_net -intf_net axi_ethernetlite_0_MDIO [get_bd_intf_ports eth_mdio_mdc] [get_bd_intf_pins axi_ethernetlite_0/MDIO]
  connect_bd_intf_net -intf_net axi_ethernetlite_0_MII [get_bd_intf_pins axi_ethernetlite_0/MII] [get_bd_intf_pins mii_to_rmii_0/MII]
  connect_bd_intf_net -intf_net axi_smc_M00_AXI [get_bd_intf_pins axi_smc/M00_AXI] [get_bd_intf_pins mig_7series_0/S_AXI]
  connect_bd_intf_net -intf_net axi_uartlite_0_UART [get_bd_intf_ports usb_uart] [get_bd_intf_pins axi_uartlite_0/UART]
  connect_bd_intf_net -intf_net axis_cep_fifo_0_M_AXIS [get_bd_intf_pins axis_cep_fifo_0/M_AXIS] [get_bd_intf_pins microblaze_0/S1_AXIS]
  connect_bd_intf_net -intf_net axis_cep_fifo_10_M_AXIS [get_bd_intf_pins axis_cep_fifo_10/M_AXIS] [get_bd_intf_pins microblaze_0/S11_AXIS]
  connect_bd_intf_net -intf_net axis_cep_fifo_11_M_AXIS [get_bd_intf_pins axis_cep_fifo_11/M_AXIS] [get_bd_intf_pins microblaze_0/S12_AXIS]
  connect_bd_intf_net -intf_net axis_cep_fifo_12_M_AXIS [get_bd_intf_pins axis_cep_fifo_12/M_AXIS] [get_bd_intf_pins microblaze_0/S13_AXIS]
  connect_bd_intf_net -intf_net axis_cep_fifo_1_M_AXIS [get_bd_intf_pins axis_cep_fifo_1/M_AXIS] [get_bd_intf_pins microblaze_0/S2_AXIS]
  connect_bd_intf_net -intf_net axis_cep_fifo_2_M_AXIS [get_bd_intf_pins axis_cep_fifo_2/M_AXIS] [get_bd_intf_pins microblaze_0/S3_AXIS]
  connect_bd_intf_net -intf_net axis_cep_fifo_3_M_AXIS [get_bd_intf_pins axis_cep_fifo_3/M_AXIS] [get_bd_intf_pins microblaze_0/S4_AXIS]
  connect_bd_intf_net -intf_net axis_cep_fifo_4_M_AXIS [get_bd_intf_pins axis_cep_fifo_4/M_AXIS] [get_bd_intf_pins microblaze_0/S5_AXIS]
  connect_bd_intf_net -intf_net axis_cep_fifo_5_M_AXIS [get_bd_intf_pins axis_cep_fifo_5/M_AXIS] [get_bd_intf_pins microblaze_0/S6_AXIS]
  connect_bd_intf_net -intf_net axis_cep_fifo_6_M_AXIS [get_bd_intf_pins axis_cep_fifo_6/M_AXIS] [get_bd_intf_pins microblaze_0/S7_AXIS]
  connect_bd_intf_net -intf_net axis_cep_fifo_7_M_AXIS [get_bd_intf_pins axis_cep_fifo_7/M_AXIS] [get_bd_intf_pins microblaze_0/S8_AXIS]
  connect_bd_intf_net -intf_net axis_cep_fifo_8_M_AXIS [get_bd_intf_pins axis_cep_fifo_8/M_AXIS] [get_bd_intf_pins microblaze_0/S9_AXIS]
  connect_bd_intf_net -intf_net axis_cep_fifo_9_M_AXIS [get_bd_intf_pins axis_cep_fifo_9/M_AXIS] [get_bd_intf_pins microblaze_0/S10_AXIS]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_DC [get_bd_intf_pins axi_smc/S00_AXI] [get_bd_intf_pins microblaze_0/M_AXI_DC]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_IC [get_bd_intf_pins axi_smc/S01_AXI] [get_bd_intf_pins microblaze_0/M_AXI_IC]
  connect_bd_intf_net -intf_net microblaze_0_axi_dp [get_bd_intf_pins microblaze_0/M_AXI_DP] [get_bd_intf_pins microblaze_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M01_AXI [get_bd_intf_pins axi_uartlite_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M02_AXI [get_bd_intf_pins axi_ethernetlite_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M03_AXI [get_bd_intf_pins axi_timer_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M04_AXI [get_bd_intf_pins PmodOLEDrgb_0/AXI_LITE_GPIO] [get_bd_intf_pins microblaze_0_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M05_AXI [get_bd_intf_pins PmodOLEDrgb_0/AXI_LITE_SPI] [get_bd_intf_pins microblaze_0_axi_periph/M05_AXI]
  connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_0_intc_axi [get_bd_intf_pins microblaze_0_axi_intc/s_axi] [get_bd_intf_pins microblaze_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_interrupt [get_bd_intf_pins microblaze_0/INTERRUPT] [get_bd_intf_pins microblaze_0_axi_intc/interrupt]
  connect_bd_intf_net -intf_net mig_7series_0_DDR2 [get_bd_intf_ports DDR2] [get_bd_intf_pins mig_7series_0/DDR2]
  connect_bd_intf_net -intf_net mii_to_rmii_0_RMII_PHY_M [get_bd_intf_ports eth_rmii] [get_bd_intf_pins mii_to_rmii_0/RMII_PHY_M]

  # Create port connections
  connect_bd_net -net accumulate15_0_data_out [get_bd_pins accumulate15_0/data_out] [get_bd_pins deriv_maker_0/data_in]
  connect_bd_net -net accumulate15_0_valid_out [get_bd_pins accumulate15_0/valid_out] [get_bd_pins deriv_maker_0/valid_in]
  connect_bd_net -net accumulate15_10_data_out [get_bd_pins accumulate15_10/data_out] [get_bd_pins deriv_maker_10/data_in]
  connect_bd_net -net accumulate15_10_valid_out [get_bd_pins accumulate15_10/valid_out] [get_bd_pins deriv_maker_10/valid_in]
  connect_bd_net -net accumulate15_11_data_out [get_bd_pins accumulate15_11/data_out] [get_bd_pins deriv_maker_11/data_in]
  connect_bd_net -net accumulate15_11_valid_out [get_bd_pins accumulate15_11/valid_out] [get_bd_pins deriv_maker_11/valid_in]
  connect_bd_net -net accumulate15_12_data_out [get_bd_pins accumulate15_12/data_out] [get_bd_pins deriv_maker_12/data_in]
  connect_bd_net -net accumulate15_12_valid_out [get_bd_pins accumulate15_12/valid_out] [get_bd_pins deriv_maker_12/valid_in]
  connect_bd_net -net accumulate15_1_data_out [get_bd_pins accumulate15_1/data_out] [get_bd_pins deriv_maker_1/data_in]
  connect_bd_net -net accumulate15_1_valid_out [get_bd_pins accumulate15_1/valid_out] [get_bd_pins deriv_maker_1/valid_in]
  connect_bd_net -net accumulate15_2_data_out [get_bd_pins accumulate15_2/data_out] [get_bd_pins deriv_maker_2/data_in]
  connect_bd_net -net accumulate15_2_valid_out [get_bd_pins accumulate15_2/valid_out] [get_bd_pins deriv_maker_2/valid_in]
  connect_bd_net -net accumulate15_3_data_out [get_bd_pins accumulate15_3/data_out] [get_bd_pins deriv_maker_3/data_in]
  connect_bd_net -net accumulate15_3_valid_out [get_bd_pins accumulate15_3/valid_out] [get_bd_pins deriv_maker_3/valid_in]
  connect_bd_net -net accumulate15_4_data_out [get_bd_pins accumulate15_4/data_out] [get_bd_pins deriv_maker_4/data_in]
  connect_bd_net -net accumulate15_4_valid_out [get_bd_pins accumulate15_4/valid_out] [get_bd_pins deriv_maker_4/valid_in]
  connect_bd_net -net accumulate15_5_data_out [get_bd_pins accumulate15_5/data_out] [get_bd_pins deriv_maker_5/data_in]
  connect_bd_net -net accumulate15_5_valid_out [get_bd_pins accumulate15_5/valid_out] [get_bd_pins deriv_maker_5/valid_in]
  connect_bd_net -net accumulate15_6_data_out [get_bd_pins accumulate15_6/data_out] [get_bd_pins deriv_maker_6/data_in]
  connect_bd_net -net accumulate15_6_valid_out [get_bd_pins accumulate15_6/valid_out] [get_bd_pins deriv_maker_6/valid_in]
  connect_bd_net -net accumulate15_7_data_out [get_bd_pins accumulate15_7/data_out] [get_bd_pins deriv_maker_7/data_in]
  connect_bd_net -net accumulate15_7_valid_out [get_bd_pins accumulate15_7/valid_out] [get_bd_pins deriv_maker_7/valid_in]
  connect_bd_net -net accumulate15_8_data_out [get_bd_pins accumulate15_8/data_out] [get_bd_pins deriv_maker_8/data_in]
  connect_bd_net -net accumulate15_8_valid_out [get_bd_pins accumulate15_8/valid_out] [get_bd_pins deriv_maker_8/valid_in]
  connect_bd_net -net accumulate15_9_data_out [get_bd_pins accumulate15_9/data_out] [get_bd_pins deriv_maker_9/data_in]
  connect_bd_net -net accumulate15_9_valid_out [get_bd_pins accumulate15_9/valid_out] [get_bd_pins deriv_maker_9/valid_in]
  connect_bd_net -net axi_ethernetlite_0_ip2intc_irpt [get_bd_pins axi_ethernetlite_0/ip2intc_irpt] [get_bd_pins microblaze_0_xlconcat/In1]
  connect_bd_net -net axi_timer_0_interrupt [get_bd_pins axi_timer_0/interrupt] [get_bd_pins microblaze_0_xlconcat/In0]
  connect_bd_net -net axis_data_fifo_10_m_axis_tdata [get_bd_pins axis_data_fifo_10/m_axis_tdata] [get_bd_pins axis_interconnect_v11_0/data_in_09]
  connect_bd_net -net axis_data_fifo_10_m_axis_tvalid [get_bd_pins axis_data_fifo_10/m_axis_tvalid] [get_bd_pins valid_concat/In9]
  connect_bd_net -net axis_data_fifo_10_s_axis_tready [get_bd_pins axis_data_fifo_10/s_axis_tready] [get_bd_pins mic_axis_block_wrapper_0/M09_AXIS_tready]
  connect_bd_net -net axis_data_fifo_11_m_axis_tdata [get_bd_pins axis_data_fifo_11/m_axis_tdata] [get_bd_pins axis_interconnect_v11_0/data_in_10]
  connect_bd_net -net axis_data_fifo_11_m_axis_tvalid [get_bd_pins axis_data_fifo_11/m_axis_tvalid] [get_bd_pins valid_concat/In10]
  connect_bd_net -net axis_data_fifo_11_s_axis_tready [get_bd_pins axis_data_fifo_11/s_axis_tready] [get_bd_pins mic_axis_block_wrapper_0/M10_AXIS_tready]
  connect_bd_net -net axis_data_fifo_12_m_axis_tdata [get_bd_pins axis_data_fifo_12/m_axis_tdata] [get_bd_pins axis_interconnect_v11_0/data_in_11]
  connect_bd_net -net axis_data_fifo_12_m_axis_tvalid [get_bd_pins axis_data_fifo_12/m_axis_tvalid] [get_bd_pins valid_concat/In11]
  connect_bd_net -net axis_data_fifo_12_s_axis_tready [get_bd_pins axis_data_fifo_12/s_axis_tready] [get_bd_pins mic_axis_block_wrapper_0/M11_AXIS_tready]
  connect_bd_net -net axis_data_fifo_13_m_axis_tdata [get_bd_pins axis_data_fifo_13/m_axis_tdata] [get_bd_pins axis_interconnect_v11_0/data_in_12]
  connect_bd_net -net axis_data_fifo_13_m_axis_tvalid [get_bd_pins axis_data_fifo_13/m_axis_tvalid] [get_bd_pins valid_concat/In12]
  connect_bd_net -net axis_data_fifo_13_s_axis_tready [get_bd_pins axis_data_fifo_13/s_axis_tready] [get_bd_pins mic_axis_block_wrapper_0/M12_AXIS_tready]
  connect_bd_net -net axis_data_fifo_14_m_axis_tdata [get_bd_pins axis_data_fifo_14/m_axis_tdata] [get_bd_pins axis_interconnect_v11_0/data_in_13]
  connect_bd_net -net axis_data_fifo_14_m_axis_tvalid [get_bd_pins axis_data_fifo_14/m_axis_tvalid] [get_bd_pins valid_concat/In13]
  connect_bd_net -net axis_data_fifo_14_s_axis_tready [get_bd_pins axis_data_fifo_14/s_axis_tready] [get_bd_pins mic_axis_block_wrapper_0/M13_AXIS_tready]
  connect_bd_net -net axis_data_fifo_15_m_axis_tdata [get_bd_pins axis_data_fifo_15/m_axis_tdata] [get_bd_pins axis_interconnect_v11_0/data_in_14]
  connect_bd_net -net axis_data_fifo_15_m_axis_tvalid [get_bd_pins axis_data_fifo_15/m_axis_tvalid] [get_bd_pins valid_concat/In14]
  connect_bd_net -net axis_data_fifo_15_s_axis_tready [get_bd_pins axis_data_fifo_15/s_axis_tready] [get_bd_pins mic_axis_block_wrapper_0/M14_AXIS_tready]
  connect_bd_net -net axis_data_fifo_1_m_axis_tdata [get_bd_pins axis_data_fifo_1/m_axis_tdata] [get_bd_pins axis_interconnect_v11_0/data_in_00]
  connect_bd_net -net axis_data_fifo_1_m_axis_tvalid [get_bd_pins axis_data_fifo_1/m_axis_tvalid] [get_bd_pins valid_concat/In0]
  connect_bd_net -net axis_data_fifo_1_s_axis_tready [get_bd_pins axis_data_fifo_1/s_axis_tready] [get_bd_pins mic_axis_block_wrapper_0/M00_AXIS_tready]
  connect_bd_net -net axis_data_fifo_2_m_axis_tdata [get_bd_pins axis_data_fifo_2/m_axis_tdata] [get_bd_pins axis_interconnect_v11_0/data_in_01]
  connect_bd_net -net axis_data_fifo_2_m_axis_tvalid [get_bd_pins axis_data_fifo_2/m_axis_tvalid] [get_bd_pins valid_concat/In1]
  connect_bd_net -net axis_data_fifo_2_s_axis_tready [get_bd_pins axis_data_fifo_2/s_axis_tready] [get_bd_pins mic_axis_block_wrapper_0/M01_AXIS_tready]
  connect_bd_net -net axis_data_fifo_3_m_axis_tdata [get_bd_pins axis_data_fifo_3/m_axis_tdata] [get_bd_pins axis_interconnect_v11_0/data_in_02]
  connect_bd_net -net axis_data_fifo_3_m_axis_tvalid [get_bd_pins axis_data_fifo_3/m_axis_tvalid] [get_bd_pins valid_concat/In2]
  connect_bd_net -net axis_data_fifo_3_s_axis_tready [get_bd_pins axis_data_fifo_3/s_axis_tready] [get_bd_pins mic_axis_block_wrapper_0/M02_AXIS_tready]
  connect_bd_net -net axis_data_fifo_4_m_axis_tdata [get_bd_pins axis_data_fifo_4/m_axis_tdata] [get_bd_pins axis_interconnect_v11_0/data_in_03]
  connect_bd_net -net axis_data_fifo_4_m_axis_tvalid [get_bd_pins axis_data_fifo_4/m_axis_tvalid] [get_bd_pins valid_concat/In3]
  connect_bd_net -net axis_data_fifo_4_s_axis_tready [get_bd_pins axis_data_fifo_4/s_axis_tready] [get_bd_pins mic_axis_block_wrapper_0/M03_AXIS_tready]
  connect_bd_net -net axis_data_fifo_5_m_axis_tdata [get_bd_pins axis_data_fifo_5/m_axis_tdata] [get_bd_pins axis_interconnect_v11_0/data_in_04]
  connect_bd_net -net axis_data_fifo_5_m_axis_tvalid [get_bd_pins axis_data_fifo_5/m_axis_tvalid] [get_bd_pins valid_concat/In4]
  connect_bd_net -net axis_data_fifo_5_s_axis_tready [get_bd_pins axis_data_fifo_5/s_axis_tready] [get_bd_pins mic_axis_block_wrapper_0/M04_AXIS_tready]
  connect_bd_net -net axis_data_fifo_6_m_axis_tdata [get_bd_pins axis_data_fifo_6/m_axis_tdata] [get_bd_pins axis_interconnect_v11_0/data_in_05]
  connect_bd_net -net axis_data_fifo_6_m_axis_tvalid [get_bd_pins axis_data_fifo_6/m_axis_tvalid] [get_bd_pins valid_concat/In5]
  connect_bd_net -net axis_data_fifo_6_s_axis_tready [get_bd_pins axis_data_fifo_6/s_axis_tready] [get_bd_pins mic_axis_block_wrapper_0/M05_AXIS_tready]
  connect_bd_net -net axis_data_fifo_7_m_axis_tdata [get_bd_pins axis_data_fifo_7/m_axis_tdata] [get_bd_pins axis_interconnect_v11_0/data_in_06]
  connect_bd_net -net axis_data_fifo_7_m_axis_tvalid [get_bd_pins axis_data_fifo_7/m_axis_tvalid] [get_bd_pins valid_concat/In6]
  connect_bd_net -net axis_data_fifo_7_s_axis_tready [get_bd_pins axis_data_fifo_7/s_axis_tready] [get_bd_pins mic_axis_block_wrapper_0/M06_AXIS_tready]
  connect_bd_net -net axis_data_fifo_8_m_axis_tdata [get_bd_pins axis_data_fifo_8/m_axis_tdata] [get_bd_pins axis_interconnect_v11_0/data_in_07]
  connect_bd_net -net axis_data_fifo_8_m_axis_tvalid [get_bd_pins axis_data_fifo_8/m_axis_tvalid] [get_bd_pins valid_concat/In7]
  connect_bd_net -net axis_data_fifo_8_s_axis_tready [get_bd_pins axis_data_fifo_8/s_axis_tready] [get_bd_pins mic_axis_block_wrapper_0/M07_AXIS_tready]
  connect_bd_net -net axis_data_fifo_9_m_axis_tdata [get_bd_pins axis_data_fifo_9/m_axis_tdata] [get_bd_pins axis_interconnect_v11_0/data_in_08]
  connect_bd_net -net axis_data_fifo_9_m_axis_tvalid [get_bd_pins axis_data_fifo_9/m_axis_tvalid] [get_bd_pins valid_concat/In8]
  connect_bd_net -net axis_data_fifo_9_s_axis_tready [get_bd_pins axis_data_fifo_9/s_axis_tready] [get_bd_pins mic_axis_block_wrapper_0/M08_AXIS_tready]
  connect_bd_net -net axis_interconnect_v11_0_d_valid_out [get_bd_pins axis_interconnect_v11_0/d_valid_out] [get_bd_pins logarithm_0/tvalid_in]
  connect_bd_net -net axis_interconnect_v11_0_data_out [get_bd_pins axis_interconnect_v11_0/data_out] [get_bd_pins logarithm_0/tdata_in]
  connect_bd_net -net axis_interconnect_v11_0_i_ready [get_bd_pins axis_interconnect_v11_0/i_ready] [get_bd_pins slicer15_0/din]
  connect_bd_net -net btn_d_1 [get_bd_ports btn_d] [get_bd_pins mic_axis_block_wrapper_0/btn_d]
  connect_bd_net -net clk_wiz_1_clk_out2 [get_bd_pins clk_wiz_1/clk_out2] [get_bd_pins mig_7series_0/sys_clk_i]
  connect_bd_net -net clk_wiz_1_clk_out3 [get_bd_ports eth_ref_clk] [get_bd_pins clk_wiz_1/clk_out3] [get_bd_pins mii_to_rmii_0/ref_clk]
  connect_bd_net -net clk_wiz_1_locked [get_bd_pins clk_wiz_1/locked] [get_bd_pins rst_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net deriv_maker_0_data_out [get_bd_pins axis_cep_fifo_0/s_axis_tdata] [get_bd_pins deriv_maker_0/data_out]
  connect_bd_net -net deriv_maker_0_valid_out [get_bd_pins axis_cep_fifo_0/s_axis_tvalid] [get_bd_pins deriv_maker_0/valid_out]
  connect_bd_net -net deriv_maker_10_data_out [get_bd_pins axis_cep_fifo_10/s_axis_tdata] [get_bd_pins deriv_maker_10/data_out]
  connect_bd_net -net deriv_maker_10_valid_out [get_bd_pins axis_cep_fifo_10/s_axis_tvalid] [get_bd_pins deriv_maker_10/valid_out]
  connect_bd_net -net deriv_maker_11_data_out [get_bd_pins axis_cep_fifo_11/s_axis_tdata] [get_bd_pins deriv_maker_11/data_out]
  connect_bd_net -net deriv_maker_11_valid_out [get_bd_pins axis_cep_fifo_11/s_axis_tvalid] [get_bd_pins deriv_maker_11/valid_out]
  connect_bd_net -net deriv_maker_12_data_out [get_bd_pins axis_cep_fifo_12/s_axis_tdata] [get_bd_pins deriv_maker_12/data_out]
  connect_bd_net -net deriv_maker_12_valid_out [get_bd_pins axis_cep_fifo_12/s_axis_tvalid] [get_bd_pins deriv_maker_12/valid_out]
  connect_bd_net -net deriv_maker_1_data_out [get_bd_pins axis_cep_fifo_1/s_axis_tdata] [get_bd_pins deriv_maker_1/data_out]
  connect_bd_net -net deriv_maker_1_valid_out [get_bd_pins axis_cep_fifo_1/s_axis_tvalid] [get_bd_pins deriv_maker_1/valid_out]
  connect_bd_net -net deriv_maker_2_data_out [get_bd_pins axis_cep_fifo_2/s_axis_tdata] [get_bd_pins deriv_maker_2/data_out]
  connect_bd_net -net deriv_maker_2_valid_out [get_bd_pins axis_cep_fifo_2/s_axis_tvalid] [get_bd_pins deriv_maker_2/valid_out]
  connect_bd_net -net deriv_maker_3_data_out [get_bd_pins axis_cep_fifo_3/s_axis_tdata] [get_bd_pins deriv_maker_3/data_out]
  connect_bd_net -net deriv_maker_3_valid_out [get_bd_pins axis_cep_fifo_3/s_axis_tvalid] [get_bd_pins deriv_maker_3/valid_out]
  connect_bd_net -net deriv_maker_4_data_out [get_bd_pins axis_cep_fifo_4/s_axis_tdata] [get_bd_pins deriv_maker_4/data_out]
  connect_bd_net -net deriv_maker_4_valid_out [get_bd_pins axis_cep_fifo_4/s_axis_tvalid] [get_bd_pins deriv_maker_4/valid_out]
  connect_bd_net -net deriv_maker_5_data_out [get_bd_pins axis_cep_fifo_5/s_axis_tdata] [get_bd_pins deriv_maker_5/data_out]
  connect_bd_net -net deriv_maker_5_valid_out [get_bd_pins axis_cep_fifo_5/s_axis_tvalid] [get_bd_pins deriv_maker_5/valid_out]
  connect_bd_net -net deriv_maker_6_data_out [get_bd_pins axis_cep_fifo_6/s_axis_tdata] [get_bd_pins deriv_maker_6/data_out]
  connect_bd_net -net deriv_maker_6_valid_out [get_bd_pins axis_cep_fifo_6/s_axis_tvalid] [get_bd_pins deriv_maker_6/valid_out]
  connect_bd_net -net deriv_maker_7_data_out [get_bd_pins axis_cep_fifo_7/s_axis_tdata] [get_bd_pins deriv_maker_7/data_out]
  connect_bd_net -net deriv_maker_7_valid_out [get_bd_pins axis_cep_fifo_7/s_axis_tvalid] [get_bd_pins deriv_maker_7/valid_out]
  connect_bd_net -net deriv_maker_8_data_out [get_bd_pins axis_cep_fifo_8/s_axis_tdata] [get_bd_pins deriv_maker_8/data_out]
  connect_bd_net -net deriv_maker_8_valid_out [get_bd_pins axis_cep_fifo_8/s_axis_tvalid] [get_bd_pins deriv_maker_8/valid_out]
  connect_bd_net -net deriv_maker_9_data_out [get_bd_pins axis_cep_fifo_9/s_axis_tdata] [get_bd_pins deriv_maker_9/data_out]
  connect_bd_net -net deriv_maker_9_valid_out [get_bd_pins axis_cep_fifo_9/s_axis_tvalid] [get_bd_pins deriv_maker_9/valid_out]
  connect_bd_net -net get_values_0_data_to_mult_a [get_bd_pins get_values_0/data_to_mult_a] [get_bd_pins mult_gen_0/A] [get_bd_pins mult_gen_1/A] [get_bd_pins mult_gen_10/A] [get_bd_pins mult_gen_11/A] [get_bd_pins mult_gen_12/A] [get_bd_pins mult_gen_2/A] [get_bd_pins mult_gen_3/A] [get_bd_pins mult_gen_4/A] [get_bd_pins mult_gen_5/A] [get_bd_pins mult_gen_6/A] [get_bd_pins mult_gen_7/A] [get_bd_pins mult_gen_8/A] [get_bd_pins mult_gen_9/A]
  connect_bd_net -net get_values_0_data_to_mult_b0 [get_bd_pins get_values_0/data_to_mult_b0] [get_bd_pins mult_gen_0/B]
  connect_bd_net -net get_values_0_data_to_mult_b1 [get_bd_pins get_values_0/data_to_mult_b1] [get_bd_pins mult_gen_1/B]
  connect_bd_net -net get_values_0_data_to_mult_b2 [get_bd_pins get_values_0/data_to_mult_b2] [get_bd_pins mult_gen_2/B]
  connect_bd_net -net get_values_0_data_to_mult_b3 [get_bd_pins get_values_0/data_to_mult_b3] [get_bd_pins mult_gen_3/B]
  connect_bd_net -net get_values_0_data_to_mult_b4 [get_bd_pins get_values_0/data_to_mult_b4] [get_bd_pins mult_gen_4/B]
  connect_bd_net -net get_values_0_data_to_mult_b5 [get_bd_pins get_values_0/data_to_mult_b5] [get_bd_pins mult_gen_5/B]
  connect_bd_net -net get_values_0_data_to_mult_b6 [get_bd_pins get_values_0/data_to_mult_b6] [get_bd_pins mult_gen_6/B]
  connect_bd_net -net get_values_0_data_to_mult_b7 [get_bd_pins get_values_0/data_to_mult_b7] [get_bd_pins mult_gen_7/B]
  connect_bd_net -net get_values_0_data_to_mult_b8 [get_bd_pins get_values_0/data_to_mult_b8] [get_bd_pins mult_gen_8/B]
  connect_bd_net -net get_values_0_data_to_mult_b9 [get_bd_pins get_values_0/data_to_mult_b9] [get_bd_pins mult_gen_9/B]
  connect_bd_net -net get_values_0_data_to_mult_b10 [get_bd_pins get_values_0/data_to_mult_b10] [get_bd_pins mult_gen_10/B]
  connect_bd_net -net get_values_0_data_to_mult_b11 [get_bd_pins get_values_0/data_to_mult_b11] [get_bd_pins mult_gen_11/B]
  connect_bd_net -net get_values_0_data_to_mult_b12 [get_bd_pins get_values_0/data_to_mult_b12] [get_bd_pins mult_gen_12/B]
  connect_bd_net -net get_values_0_mult_valid [get_bd_pins accumulate15_0/mult_valid] [get_bd_pins accumulate15_1/mult_valid] [get_bd_pins accumulate15_10/mult_valid] [get_bd_pins accumulate15_11/mult_valid] [get_bd_pins accumulate15_12/mult_valid] [get_bd_pins accumulate15_2/mult_valid] [get_bd_pins accumulate15_3/mult_valid] [get_bd_pins accumulate15_4/mult_valid] [get_bd_pins accumulate15_5/mult_valid] [get_bd_pins accumulate15_6/mult_valid] [get_bd_pins accumulate15_7/mult_valid] [get_bd_pins accumulate15_8/mult_valid] [get_bd_pins accumulate15_9/mult_valid] [get_bd_pins get_values_0/mult_valid]
  connect_bd_net -net get_values_0_tready_out [get_bd_pins axis_interconnect_v11_0/p_ready] [get_bd_pins get_values_0/tready_out]
  connect_bd_net -net logarithm_0_tdata_out [get_bd_pins get_values_0/tdata_in] [get_bd_pins logarithm_0/tdata_out]
  connect_bd_net -net logarithm_0_tvalid_out [get_bd_pins get_values_0/tvalid_in] [get_bd_pins logarithm_0/tvalid_out]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins mdm_1/Debug_SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/mb_debug_sys_rst]
  connect_bd_net -net mic_axis_block_wrapper_0_M00_AXIS_tdata [get_bd_pins axis_data_fifo_1/s_axis_tdata] [get_bd_pins mic_axis_block_wrapper_0/M00_AXIS_tdata]
  connect_bd_net -net mic_axis_block_wrapper_0_M00_AXIS_tvalid [get_bd_pins axis_data_fifo_1/s_axis_tvalid] [get_bd_pins mic_axis_block_wrapper_0/M00_AXIS_tvalid]
  connect_bd_net -net mic_axis_block_wrapper_0_M01_AXIS_tdata [get_bd_pins axis_data_fifo_2/s_axis_tdata] [get_bd_pins mic_axis_block_wrapper_0/M01_AXIS_tdata]
  connect_bd_net -net mic_axis_block_wrapper_0_M01_AXIS_tvalid [get_bd_pins axis_data_fifo_2/s_axis_tvalid] [get_bd_pins mic_axis_block_wrapper_0/M01_AXIS_tvalid]
  connect_bd_net -net mic_axis_block_wrapper_0_M02_AXIS_tdata [get_bd_pins axis_data_fifo_3/s_axis_tdata] [get_bd_pins mic_axis_block_wrapper_0/M02_AXIS_tdata]
  connect_bd_net -net mic_axis_block_wrapper_0_M02_AXIS_tvalid [get_bd_pins axis_data_fifo_3/s_axis_tvalid] [get_bd_pins mic_axis_block_wrapper_0/M02_AXIS_tvalid]
  connect_bd_net -net mic_axis_block_wrapper_0_M03_AXIS_tdata [get_bd_pins axis_data_fifo_4/s_axis_tdata] [get_bd_pins mic_axis_block_wrapper_0/M03_AXIS_tdata]
  connect_bd_net -net mic_axis_block_wrapper_0_M03_AXIS_tvalid [get_bd_pins axis_data_fifo_4/s_axis_tvalid] [get_bd_pins mic_axis_block_wrapper_0/M03_AXIS_tvalid]
  connect_bd_net -net mic_axis_block_wrapper_0_M04_AXIS_tdata [get_bd_pins axis_data_fifo_5/s_axis_tdata] [get_bd_pins mic_axis_block_wrapper_0/M04_AXIS_tdata]
  connect_bd_net -net mic_axis_block_wrapper_0_M04_AXIS_tvalid [get_bd_pins axis_data_fifo_5/s_axis_tvalid] [get_bd_pins mic_axis_block_wrapper_0/M04_AXIS_tvalid]
  connect_bd_net -net mic_axis_block_wrapper_0_M05_AXIS_tdata [get_bd_pins axis_data_fifo_6/s_axis_tdata] [get_bd_pins mic_axis_block_wrapper_0/M05_AXIS_tdata]
  connect_bd_net -net mic_axis_block_wrapper_0_M05_AXIS_tvalid [get_bd_pins axis_data_fifo_6/s_axis_tvalid] [get_bd_pins mic_axis_block_wrapper_0/M05_AXIS_tvalid]
  connect_bd_net -net mic_axis_block_wrapper_0_M06_AXIS_tdata [get_bd_pins axis_data_fifo_7/s_axis_tdata] [get_bd_pins mic_axis_block_wrapper_0/M06_AXIS_tdata]
  connect_bd_net -net mic_axis_block_wrapper_0_M06_AXIS_tvalid [get_bd_pins axis_data_fifo_7/s_axis_tvalid] [get_bd_pins mic_axis_block_wrapper_0/M06_AXIS_tvalid]
  connect_bd_net -net mic_axis_block_wrapper_0_M07_AXIS_tdata [get_bd_pins axis_data_fifo_8/s_axis_tdata] [get_bd_pins mic_axis_block_wrapper_0/M07_AXIS_tdata]
  connect_bd_net -net mic_axis_block_wrapper_0_M07_AXIS_tvalid [get_bd_pins axis_data_fifo_8/s_axis_tvalid] [get_bd_pins mic_axis_block_wrapper_0/M07_AXIS_tvalid]
  connect_bd_net -net mic_axis_block_wrapper_0_M08_AXIS_tdata [get_bd_pins axis_data_fifo_9/s_axis_tdata] [get_bd_pins mic_axis_block_wrapper_0/M08_AXIS_tdata]
  connect_bd_net -net mic_axis_block_wrapper_0_M08_AXIS_tvalid [get_bd_pins axis_data_fifo_9/s_axis_tvalid] [get_bd_pins mic_axis_block_wrapper_0/M08_AXIS_tvalid]
  connect_bd_net -net mic_axis_block_wrapper_0_M09_AXIS_tdata [get_bd_pins axis_data_fifo_10/s_axis_tdata] [get_bd_pins mic_axis_block_wrapper_0/M09_AXIS_tdata]
  connect_bd_net -net mic_axis_block_wrapper_0_M09_AXIS_tvalid [get_bd_pins axis_data_fifo_10/s_axis_tvalid] [get_bd_pins mic_axis_block_wrapper_0/M09_AXIS_tvalid]
  connect_bd_net -net mic_axis_block_wrapper_0_M10_AXIS_tdata [get_bd_pins axis_data_fifo_11/s_axis_tdata] [get_bd_pins mic_axis_block_wrapper_0/M10_AXIS_tdata]
  connect_bd_net -net mic_axis_block_wrapper_0_M10_AXIS_tvalid [get_bd_pins axis_data_fifo_11/s_axis_tvalid] [get_bd_pins mic_axis_block_wrapper_0/M10_AXIS_tvalid]
  connect_bd_net -net mic_axis_block_wrapper_0_M11_AXIS_tdata [get_bd_pins axis_data_fifo_12/s_axis_tdata] [get_bd_pins mic_axis_block_wrapper_0/M11_AXIS_tdata]
  connect_bd_net -net mic_axis_block_wrapper_0_M11_AXIS_tvalid [get_bd_pins axis_data_fifo_12/s_axis_tvalid] [get_bd_pins mic_axis_block_wrapper_0/M11_AXIS_tvalid]
  connect_bd_net -net mic_axis_block_wrapper_0_M12_AXIS_tdata [get_bd_pins axis_data_fifo_13/s_axis_tdata] [get_bd_pins mic_axis_block_wrapper_0/M12_AXIS_tdata]
  connect_bd_net -net mic_axis_block_wrapper_0_M12_AXIS_tvalid [get_bd_pins axis_data_fifo_13/s_axis_tvalid] [get_bd_pins mic_axis_block_wrapper_0/M12_AXIS_tvalid]
  connect_bd_net -net mic_axis_block_wrapper_0_M13_AXIS_tdata [get_bd_pins axis_data_fifo_14/s_axis_tdata] [get_bd_pins mic_axis_block_wrapper_0/M13_AXIS_tdata]
  connect_bd_net -net mic_axis_block_wrapper_0_M13_AXIS_tvalid [get_bd_pins axis_data_fifo_14/s_axis_tvalid] [get_bd_pins mic_axis_block_wrapper_0/M13_AXIS_tvalid]
  connect_bd_net -net mic_axis_block_wrapper_0_M14_AXIS_tdata [get_bd_pins axis_data_fifo_15/s_axis_tdata] [get_bd_pins mic_axis_block_wrapper_0/M14_AXIS_tdata]
  connect_bd_net -net mic_axis_block_wrapper_0_M14_AXIS_tvalid [get_bd_pins axis_data_fifo_15/s_axis_tvalid] [get_bd_pins mic_axis_block_wrapper_0/M14_AXIS_tvalid]
  connect_bd_net -net mic_axis_block_wrapper_0_mic_clk_o [get_bd_ports mic_clk_o] [get_bd_pins mic_axis_block_wrapper_0/mic_clk_o]
  connect_bd_net -net mic_axis_block_wrapper_0_mic_lrsel_o [get_bd_ports mic_lrsel_o] [get_bd_pins mic_axis_block_wrapper_0/mic_lrsel_o]
  connect_bd_net -net mic_data_i_1 [get_bd_ports mic_data_i] [get_bd_pins mic_axis_block_wrapper_0/mic_data_i]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins PmodOLEDrgb_0/ext_spi_clk] [get_bd_pins PmodOLEDrgb_0/s_axi_aclk] [get_bd_pins PmodOLEDrgb_0/s_axi_aclk2] [get_bd_pins accumulate15_0/clk] [get_bd_pins accumulate15_1/clk] [get_bd_pins accumulate15_10/clk] [get_bd_pins accumulate15_11/clk] [get_bd_pins accumulate15_12/clk] [get_bd_pins accumulate15_2/clk] [get_bd_pins accumulate15_3/clk] [get_bd_pins accumulate15_4/clk] [get_bd_pins accumulate15_5/clk] [get_bd_pins accumulate15_6/clk] [get_bd_pins accumulate15_7/clk] [get_bd_pins accumulate15_8/clk] [get_bd_pins accumulate15_9/clk] [get_bd_pins axi_ethernetlite_0/s_axi_aclk] [get_bd_pins axi_smc/aclk] [get_bd_pins axi_timer_0/s_axi_aclk] [get_bd_pins axi_uartlite_0/s_axi_aclk] [get_bd_pins axis_cep_fifo_0/s_axis_aclk] [get_bd_pins axis_cep_fifo_1/s_axis_aclk] [get_bd_pins axis_cep_fifo_10/s_axis_aclk] [get_bd_pins axis_cep_fifo_11/s_axis_aclk] [get_bd_pins axis_cep_fifo_12/s_axis_aclk] [get_bd_pins axis_cep_fifo_2/s_axis_aclk] [get_bd_pins axis_cep_fifo_3/s_axis_aclk] [get_bd_pins axis_cep_fifo_4/s_axis_aclk] [get_bd_pins axis_cep_fifo_5/s_axis_aclk] [get_bd_pins axis_cep_fifo_6/s_axis_aclk] [get_bd_pins axis_cep_fifo_7/s_axis_aclk] [get_bd_pins axis_cep_fifo_8/s_axis_aclk] [get_bd_pins axis_cep_fifo_9/s_axis_aclk] [get_bd_pins axis_data_fifo_1/s_axis_aclk] [get_bd_pins axis_data_fifo_10/s_axis_aclk] [get_bd_pins axis_data_fifo_11/s_axis_aclk] [get_bd_pins axis_data_fifo_12/s_axis_aclk] [get_bd_pins axis_data_fifo_13/s_axis_aclk] [get_bd_pins axis_data_fifo_14/s_axis_aclk] [get_bd_pins axis_data_fifo_15/s_axis_aclk] [get_bd_pins axis_data_fifo_2/s_axis_aclk] [get_bd_pins axis_data_fifo_3/s_axis_aclk] [get_bd_pins axis_data_fifo_4/s_axis_aclk] [get_bd_pins axis_data_fifo_5/s_axis_aclk] [get_bd_pins axis_data_fifo_6/s_axis_aclk] [get_bd_pins axis_data_fifo_7/s_axis_aclk] [get_bd_pins axis_data_fifo_8/s_axis_aclk] [get_bd_pins axis_data_fifo_9/s_axis_aclk] [get_bd_pins axis_interconnect_v11_0/clk] [get_bd_pins clk_wiz_1/clk_out1] [get_bd_pins deriv_maker_0/clk] [get_bd_pins deriv_maker_1/clk] [get_bd_pins deriv_maker_10/clk] [get_bd_pins deriv_maker_11/clk] [get_bd_pins deriv_maker_12/clk] [get_bd_pins deriv_maker_2/clk] [get_bd_pins deriv_maker_3/clk] [get_bd_pins deriv_maker_4/clk] [get_bd_pins deriv_maker_5/clk] [get_bd_pins deriv_maker_6/clk] [get_bd_pins deriv_maker_7/clk] [get_bd_pins deriv_maker_8/clk] [get_bd_pins deriv_maker_9/clk] [get_bd_pins get_values_0/clk] [get_bd_pins logarithm_0/clk] [get_bd_pins mic_axis_block_wrapper_0/clk] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_intc/processor_clk] [get_bd_pins microblaze_0_axi_intc/s_axi_aclk] [get_bd_pins microblaze_0_axi_periph/ACLK] [get_bd_pins microblaze_0_axi_periph/M00_ACLK] [get_bd_pins microblaze_0_axi_periph/M01_ACLK] [get_bd_pins microblaze_0_axi_periph/M02_ACLK] [get_bd_pins microblaze_0_axi_periph/M03_ACLK] [get_bd_pins microblaze_0_axi_periph/M04_ACLK] [get_bd_pins microblaze_0_axi_periph/M05_ACLK] [get_bd_pins microblaze_0_axi_periph/S00_ACLK] [get_bd_pins microblaze_0_local_memory/LMB_Clk] [get_bd_pins mult_gen_0/CLK] [get_bd_pins mult_gen_1/CLK] [get_bd_pins mult_gen_10/CLK] [get_bd_pins mult_gen_11/CLK] [get_bd_pins mult_gen_12/CLK] [get_bd_pins mult_gen_2/CLK] [get_bd_pins mult_gen_3/CLK] [get_bd_pins mult_gen_4/CLK] [get_bd_pins mult_gen_5/CLK] [get_bd_pins mult_gen_6/CLK] [get_bd_pins mult_gen_7/CLK] [get_bd_pins mult_gen_8/CLK] [get_bd_pins mult_gen_9/CLK] [get_bd_pins rst_clk_wiz_1_100M/slowest_sync_clk]
  connect_bd_net -net microblaze_0_intr [get_bd_pins microblaze_0_axi_intc/intr] [get_bd_pins microblaze_0_xlconcat/dout]
  connect_bd_net -net mig_7series_0_mmcm_locked [get_bd_pins mig_7series_0/mmcm_locked] [get_bd_pins rst_mig_7series_0_81M/dcm_locked]
  connect_bd_net -net mig_7series_0_ui_clk [get_bd_pins axi_smc/aclk1] [get_bd_pins mig_7series_0/ui_clk] [get_bd_pins rst_mig_7series_0_81M/slowest_sync_clk]
  connect_bd_net -net mig_7series_0_ui_clk_sync_rst [get_bd_pins mig_7series_0/ui_clk_sync_rst] [get_bd_pins rst_mig_7series_0_81M/ext_reset_in]
  connect_bd_net -net mult_gen_0_P [get_bd_pins accumulate15_0/mult_data] [get_bd_pins mult_gen_0/P]
  connect_bd_net -net mult_gen_10_P [get_bd_pins accumulate15_10/mult_data] [get_bd_pins mult_gen_10/P]
  connect_bd_net -net mult_gen_11_P [get_bd_pins accumulate15_11/mult_data] [get_bd_pins mult_gen_11/P]
  connect_bd_net -net mult_gen_12_P [get_bd_pins accumulate15_12/mult_data] [get_bd_pins mult_gen_12/P]
  connect_bd_net -net mult_gen_1_P [get_bd_pins accumulate15_1/mult_data] [get_bd_pins mult_gen_1/P]
  connect_bd_net -net mult_gen_2_P [get_bd_pins accumulate15_2/mult_data] [get_bd_pins mult_gen_2/P]
  connect_bd_net -net mult_gen_3_P [get_bd_pins accumulate15_3/mult_data] [get_bd_pins mult_gen_3/P]
  connect_bd_net -net mult_gen_4_P [get_bd_pins accumulate15_4/mult_data] [get_bd_pins mult_gen_4/P]
  connect_bd_net -net mult_gen_5_P [get_bd_pins accumulate15_5/mult_data] [get_bd_pins mult_gen_5/P]
  connect_bd_net -net mult_gen_6_P [get_bd_pins accumulate15_6/mult_data] [get_bd_pins mult_gen_6/P]
  connect_bd_net -net mult_gen_7_P [get_bd_pins accumulate15_7/mult_data] [get_bd_pins mult_gen_7/P]
  connect_bd_net -net mult_gen_8_P [get_bd_pins accumulate15_8/mult_data] [get_bd_pins mult_gen_8/P]
  connect_bd_net -net mult_gen_9_P [get_bd_pins accumulate15_9/mult_data] [get_bd_pins mult_gen_9/P]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins clk_wiz_1/resetn] [get_bd_pins mig_7series_0/sys_rst] [get_bd_pins mii_to_rmii_0/rst_n] [get_bd_pins rst_clk_wiz_1_100M/ext_reset_in]
  connect_bd_net -net rst_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_0_local_memory/SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_interconnect_aresetn [get_bd_pins axis_cep_fifo_0/s_axis_aresetn] [get_bd_pins axis_cep_fifo_1/s_axis_aresetn] [get_bd_pins axis_cep_fifo_10/s_axis_aresetn] [get_bd_pins axis_cep_fifo_11/s_axis_aresetn] [get_bd_pins axis_cep_fifo_12/s_axis_aresetn] [get_bd_pins axis_cep_fifo_2/s_axis_aresetn] [get_bd_pins axis_cep_fifo_3/s_axis_aresetn] [get_bd_pins axis_cep_fifo_4/s_axis_aresetn] [get_bd_pins axis_cep_fifo_5/s_axis_aresetn] [get_bd_pins axis_cep_fifo_6/s_axis_aresetn] [get_bd_pins axis_cep_fifo_7/s_axis_aresetn] [get_bd_pins axis_cep_fifo_8/s_axis_aresetn] [get_bd_pins axis_cep_fifo_9/s_axis_aresetn] [get_bd_pins axis_data_fifo_1/s_axis_aresetn] [get_bd_pins axis_data_fifo_10/s_axis_aresetn] [get_bd_pins axis_data_fifo_11/s_axis_aresetn] [get_bd_pins axis_data_fifo_12/s_axis_aresetn] [get_bd_pins axis_data_fifo_13/s_axis_aresetn] [get_bd_pins axis_data_fifo_14/s_axis_aresetn] [get_bd_pins axis_data_fifo_15/s_axis_aresetn] [get_bd_pins axis_data_fifo_2/s_axis_aresetn] [get_bd_pins axis_data_fifo_3/s_axis_aresetn] [get_bd_pins axis_data_fifo_4/s_axis_aresetn] [get_bd_pins axis_data_fifo_5/s_axis_aresetn] [get_bd_pins axis_data_fifo_6/s_axis_aresetn] [get_bd_pins axis_data_fifo_7/s_axis_aresetn] [get_bd_pins axis_data_fifo_8/s_axis_aresetn] [get_bd_pins axis_data_fifo_9/s_axis_aresetn] [get_bd_pins microblaze_0_axi_periph/ARESETN] [get_bd_pins rst_clk_wiz_1_100M/interconnect_aresetn]
  connect_bd_net -net rst_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_0/Reset] [get_bd_pins microblaze_0_axi_intc/processor_rst] [get_bd_pins rst_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins PmodOLEDrgb_0/s_axi_aresetn] [get_bd_pins axi_ethernetlite_0/s_axi_aresetn] [get_bd_pins axi_timer_0/s_axi_aresetn] [get_bd_pins axi_uartlite_0/s_axi_aresetn] [get_bd_pins mic_axis_block_wrapper_0/resetn] [get_bd_pins microblaze_0_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_0_axi_periph/M00_ARESETN] [get_bd_pins microblaze_0_axi_periph/M01_ARESETN] [get_bd_pins microblaze_0_axi_periph/M02_ARESETN] [get_bd_pins microblaze_0_axi_periph/M03_ARESETN] [get_bd_pins microblaze_0_axi_periph/M04_ARESETN] [get_bd_pins microblaze_0_axi_periph/M05_ARESETN] [get_bd_pins microblaze_0_axi_periph/S00_ARESETN] [get_bd_pins rst_clk_wiz_1_100M/peripheral_aresetn]
  connect_bd_net -net rst_mig_7series_0_81M_peripheral_aresetn [get_bd_pins axi_smc/aresetn] [get_bd_pins mig_7series_0/aresetn] [get_bd_pins rst_mig_7series_0_81M/peripheral_aresetn]
  connect_bd_net -net slicer15_0_out00 [get_bd_pins axis_data_fifo_1/m_axis_tready] [get_bd_pins slicer15_0/out00]
  connect_bd_net -net slicer15_0_out01 [get_bd_pins axis_data_fifo_2/m_axis_tready] [get_bd_pins slicer15_0/out01]
  connect_bd_net -net slicer15_0_out02 [get_bd_pins axis_data_fifo_3/m_axis_tready] [get_bd_pins slicer15_0/out02]
  connect_bd_net -net slicer15_0_out03 [get_bd_pins axis_data_fifo_4/m_axis_tready] [get_bd_pins slicer15_0/out03]
  connect_bd_net -net slicer15_0_out04 [get_bd_pins axis_data_fifo_5/m_axis_tready] [get_bd_pins slicer15_0/out04]
  connect_bd_net -net slicer15_0_out05 [get_bd_pins axis_data_fifo_6/m_axis_tready] [get_bd_pins slicer15_0/out05]
  connect_bd_net -net slicer15_0_out06 [get_bd_pins axis_data_fifo_7/m_axis_tready] [get_bd_pins slicer15_0/out06]
  connect_bd_net -net slicer15_0_out07 [get_bd_pins axis_data_fifo_8/m_axis_tready] [get_bd_pins slicer15_0/out07]
  connect_bd_net -net slicer15_0_out08 [get_bd_pins axis_data_fifo_9/m_axis_tready] [get_bd_pins slicer15_0/out08]
  connect_bd_net -net slicer15_0_out09 [get_bd_pins axis_data_fifo_10/m_axis_tready] [get_bd_pins slicer15_0/out09]
  connect_bd_net -net slicer15_0_out10 [get_bd_pins axis_data_fifo_11/m_axis_tready] [get_bd_pins slicer15_0/out10]
  connect_bd_net -net slicer15_0_out11 [get_bd_pins axis_data_fifo_12/m_axis_tready] [get_bd_pins slicer15_0/out11]
  connect_bd_net -net slicer15_0_out12 [get_bd_pins axis_data_fifo_13/m_axis_tready] [get_bd_pins slicer15_0/out12]
  connect_bd_net -net slicer15_0_out13 [get_bd_pins axis_data_fifo_14/m_axis_tready] [get_bd_pins slicer15_0/out13]
  connect_bd_net -net slicer15_0_out14 [get_bd_pins axis_data_fifo_15/m_axis_tready] [get_bd_pins slicer15_0/out14]
  connect_bd_net -net sys_clock_1 [get_bd_ports sys_clock] [get_bd_pins clk_wiz_1/clk_in1]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins axis_interconnect_v11_0/d_valid] [get_bd_pins valid_concat/dout]

  # Create address segments
  create_bd_addr_seg -range 0x00010000 -offset 0x44A00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs PmodOLEDrgb_0/AXI_LITE_GPIO/AXI_LITE_GPIO_reg] SEG_PmodOLEDrgb_0_AXI_LITE_GPIO_reg
  create_bd_addr_seg -range 0x00010000 -offset 0x44A10000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs PmodOLEDrgb_0/AXI_LITE_SPI/AXI_LITE_SPI_reg] SEG_PmodOLEDrgb_0_AXI_LITE_SPI_reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40E00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_ethernetlite_0/S_AXI/Reg] SEG_axi_ethernetlite_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x41C00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_timer_0/S_AXI/Reg] SEG_axi_timer_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40600000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg
  create_bd_addr_seg -range 0x00008000 -offset 0x00000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00008000 -offset 0x00000000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00010000 -offset 0x41200000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_axi_intc/S_AXI/Reg] SEG_microblaze_0_axi_intc_Reg
  create_bd_addr_seg -range 0x08000000 -offset 0x80000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x08000000 -offset 0x80000000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


