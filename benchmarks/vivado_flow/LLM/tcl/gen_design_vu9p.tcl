
################################################################
# This is a generated script based on design: design_1
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
set scripts_vivado_version 2023.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following
# module references:
# bert_all

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcvu9p-flga2104-2L-e
   set_property BOARD_PART xilinx.com:vcu118:part0:2.4 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

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
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

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

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\
xilinx.com:ip:axi_clock_converter:2.1\
xilinx.com:ip:smartconnect:1.0\
xilinx.com:ip:clk_wiz:6.0\
xilinx.com:ip:ddr4:2.2\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:util_ds_buf:2.2\
xilinx.com:ip:xdma:4.1\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\
bert_all\
"

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set ddr4_sdram_c1_062 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 ddr4_sdram_c1_062 ]

  set default_250mhz_clk1 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 default_250mhz_clk1 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {250000000} \
   ] $default_250mhz_clk1

  set pci_express_x1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pci_express_x1 ]

  set pcie_refclk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 pcie_refclk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000} \
   ] $pcie_refclk


  # Create ports
  set pcie_perstn [ create_bd_port -dir I -type rst pcie_perstn ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $pcie_perstn
  set reset [ create_bd_port -dir I -type rst reset ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $reset

  # Create instance: axi_clock_converter_0, and set properties
  set axi_clock_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_clock_converter:2.1 axi_clock_converter_0 ]

  # Create instance: axi_clock_converter_1, and set properties
  set axi_clock_converter_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_clock_converter:2.1 axi_clock_converter_1 ]

  # Create instance: axi_clock_converter_2, and set properties
  set axi_clock_converter_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_clock_converter:2.1 axi_clock_converter_2 ]

  # Create instance: axi_clock_converter_3, and set properties
  set axi_clock_converter_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_clock_converter:2.1 axi_clock_converter_3 ]

  # Create instance: axi_clock_converter_4, and set properties
  set axi_clock_converter_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_clock_converter:2.1 axi_clock_converter_4 ]

  # Create instance: axi_clock_converter_5, and set properties
  set axi_clock_converter_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_clock_converter:2.1 axi_clock_converter_5 ]

  # Create instance: axi_clock_converter_6, and set properties
  set axi_clock_converter_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_clock_converter:2.1 axi_clock_converter_6 ]

  # Create instance: axi_clock_converter_7, and set properties
  set axi_clock_converter_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_clock_converter:2.1 axi_clock_converter_7 ]

  # Create instance: axi_clock_converter_8, and set properties
  set axi_clock_converter_8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_clock_converter:2.1 axi_clock_converter_8 ]

  # Create instance: axi_clock_converter_9, and set properties
  set axi_clock_converter_9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_clock_converter:2.1 axi_clock_converter_9 ]

  # Create instance: axi_smc, and set properties
  set axi_smc [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 axi_smc ]
  set_property -dict [list \
    CONFIG.NUM_CLKS {3} \
    CONFIG.NUM_MI {2} \
    CONFIG.NUM_SI {2} \
  ] $axi_smc


  # Create instance: bert_all_0, and set properties
  set block_name bert_all
  set block_cell_name bert_all_0
  if { [catch {set bert_all_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bert_all_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }

  set_property -dict [ list \
   CONFIG.FREQ_HZ {350000000} \
 ] [get_bd_intf_pins /bert_all_0/m_axi_gmem0]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {350000000} \
 ] [get_bd_intf_pins /bert_all_0/m_axi_gmem1]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {350000000} \
 ] [get_bd_intf_pins /bert_all_0/m_axi_gmem2]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {350000000} \
 ] [get_bd_intf_pins /bert_all_0/m_axi_gmem3]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {350000000} \
 ] [get_bd_intf_pins /bert_all_0/m_axi_gmem4]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {350000000} \
 ] [get_bd_intf_pins /bert_all_0/m_axi_gmem5]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {350000000} \
 ] [get_bd_intf_pins /bert_all_0/m_axi_gmem6]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {350000000} \
 ] [get_bd_intf_pins /bert_all_0/m_axi_gmem7]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {350000000} \
 ] [get_bd_intf_pins /bert_all_0/m_axi_gmem8]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {350000000} \
 ] [get_bd_intf_pins /bert_all_0/m_axi_gmem9]

  set_property -dict [ list \
   CONFIG.FREQ_HZ {350000000} \
 ] [get_bd_intf_pins /bert_all_0/s_axi_control]

  # Create instance: clk_kernel, and set properties
  set clk_kernel [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_kernel ]
  set_property -dict [list \
    CONFIG.CLKOUT1_JITTER {151.657} \
    CONFIG.CLKOUT1_PHASE_ERROR {222.060} \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {350} \
    CONFIG.MMCM_CLKFBOUT_MULT_F {47.250} \
    CONFIG.MMCM_CLKOUT0_DIVIDE_F {3.375} \
    CONFIG.RESET_PORT {resetn} \
    CONFIG.RESET_TYPE {ACTIVE_LOW} \
  ] $clk_kernel


  # Create instance: clk_slow_axi, and set properties
  set clk_slow_axi [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_slow_axi ]
  set_property -dict [list \
    CONFIG.RESET_PORT {resetn} \
    CONFIG.RESET_TYPE {ACTIVE_LOW} \
  ] $clk_slow_axi


  # Create instance: ddr4_0, and set properties
  set ddr4_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ddr4:2.2 ddr4_0 ]
  set_property -dict [list \
    CONFIG.C0_CLOCK_BOARD_INTERFACE {default_250mhz_clk1} \
    CONFIG.C0_DDR4_BOARD_INTERFACE {ddr4_sdram_c1_062} \
    CONFIG.RESET_BOARD_INTERFACE {reset} \
  ] $ddr4_0


  # Create instance: reset_kernel, and set properties
  set reset_kernel [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 reset_kernel ]

  # Create instance: reset_slow_axi, and set properties
  set reset_slow_axi [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 reset_slow_axi ]

  # Create instance: rst_ddr4_0_300M, and set properties
  set rst_ddr4_0_300M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ddr4_0_300M ]

  # Create instance: smartconnect_0, and set properties
  set smartconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0 ]
  set_property -dict [list \
    CONFIG.NUM_CLKS {1} \
    CONFIG.NUM_SI {5} \
  ] $smartconnect_0


  # Create instance: smartconnect_1, and set properties
  set smartconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_1 ]
  set_property -dict [list \
    CONFIG.NUM_CLKS {1} \
    CONFIG.NUM_SI {6} \
  ] $smartconnect_1


  # Create instance: util_ds_buf, and set properties
  set util_ds_buf [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.2 util_ds_buf ]
  set_property -dict [list \
    CONFIG.DIFF_CLK_IN_BOARD_INTERFACE {pcie_refclk} \
    CONFIG.USE_BOARD_FLOW {true} \
  ] $util_ds_buf


  # Create instance: xdma_0, and set properties
  set xdma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xdma:4.1 xdma_0 ]
  set_property -dict [list \
    CONFIG.PCIE_BOARD_INTERFACE {pci_express_x1} \
    CONFIG.SYS_RST_N_BOARD_INTERFACE {pcie_perstn} \
    CONFIG.axi_data_width {64_bit} \
    CONFIG.axilite_master_en {true} \
    CONFIG.axisten_freq {125} \
    CONFIG.pl_link_cap_max_link_speed {8.0_GT/s} \
    CONFIG.xdma_axi_intf_mm {AXI_Memory_Mapped} \
    CONFIG.xdma_axilite_slave {false} \
    CONFIG.xdma_rnum_chnl {4} \
    CONFIG.xdma_wnum_chnl {4} \
  ] $xdma_0


  # Create instance: xdma_0_axi_periph, and set properties
  set xdma_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 xdma_0_axi_periph ]
  set_property CONFIG.NUM_MI {3} $xdma_0_axi_periph


  # Create interface connections
  connect_bd_intf_net -intf_net axi_clock_converter_0_M_AXI [get_bd_intf_pins axi_clock_converter_0/M_AXI] [get_bd_intf_pins smartconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net axi_clock_converter_1_M_AXI [get_bd_intf_pins axi_clock_converter_1/M_AXI] [get_bd_intf_pins smartconnect_0/S01_AXI]
  connect_bd_intf_net -intf_net axi_clock_converter_2_M_AXI [get_bd_intf_pins axi_clock_converter_2/M_AXI] [get_bd_intf_pins smartconnect_0/S02_AXI]
  connect_bd_intf_net -intf_net axi_clock_converter_3_M_AXI [get_bd_intf_pins axi_clock_converter_3/M_AXI] [get_bd_intf_pins smartconnect_0/S03_AXI]
  connect_bd_intf_net -intf_net axi_clock_converter_4_M_AXI [get_bd_intf_pins axi_clock_converter_4/M_AXI] [get_bd_intf_pins smartconnect_0/S04_AXI]
  connect_bd_intf_net -intf_net axi_clock_converter_5_M_AXI [get_bd_intf_pins axi_clock_converter_5/M_AXI] [get_bd_intf_pins smartconnect_1/S00_AXI]
  connect_bd_intf_net -intf_net axi_clock_converter_6_M_AXI [get_bd_intf_pins axi_clock_converter_6/M_AXI] [get_bd_intf_pins smartconnect_1/S01_AXI]
  connect_bd_intf_net -intf_net axi_clock_converter_7_M_AXI [get_bd_intf_pins axi_clock_converter_7/M_AXI] [get_bd_intf_pins smartconnect_1/S02_AXI]
  connect_bd_intf_net -intf_net axi_clock_converter_8_M_AXI [get_bd_intf_pins axi_clock_converter_8/M_AXI] [get_bd_intf_pins smartconnect_1/S03_AXI]
  connect_bd_intf_net -intf_net axi_clock_converter_9_M_AXI [get_bd_intf_pins axi_clock_converter_9/M_AXI] [get_bd_intf_pins smartconnect_1/S04_AXI]
  connect_bd_intf_net -intf_net axi_smc_M00_AXI [get_bd_intf_pins axi_smc/M00_AXI] [get_bd_intf_pins ddr4_0/C0_DDR4_S_AXI]
  connect_bd_intf_net -intf_net bert_all_0_m_axi_gmem0 [get_bd_intf_pins axi_clock_converter_0/S_AXI] [get_bd_intf_pins bert_all_0/m_axi_gmem0]
  connect_bd_intf_net -intf_net bert_all_0_m_axi_gmem1 [get_bd_intf_pins axi_clock_converter_1/S_AXI] [get_bd_intf_pins bert_all_0/m_axi_gmem1]
  connect_bd_intf_net -intf_net bert_all_0_m_axi_gmem2 [get_bd_intf_pins axi_clock_converter_2/S_AXI] [get_bd_intf_pins bert_all_0/m_axi_gmem2]
  connect_bd_intf_net -intf_net bert_all_0_m_axi_gmem3 [get_bd_intf_pins axi_clock_converter_3/S_AXI] [get_bd_intf_pins bert_all_0/m_axi_gmem3]
  connect_bd_intf_net -intf_net bert_all_0_m_axi_gmem4 [get_bd_intf_pins axi_clock_converter_4/S_AXI] [get_bd_intf_pins bert_all_0/m_axi_gmem4]
  connect_bd_intf_net -intf_net bert_all_0_m_axi_gmem5 [get_bd_intf_pins axi_clock_converter_5/S_AXI] [get_bd_intf_pins bert_all_0/m_axi_gmem5]
  connect_bd_intf_net -intf_net bert_all_0_m_axi_gmem6 [get_bd_intf_pins axi_clock_converter_6/S_AXI] [get_bd_intf_pins bert_all_0/m_axi_gmem6]
  connect_bd_intf_net -intf_net bert_all_0_m_axi_gmem7 [get_bd_intf_pins axi_clock_converter_7/S_AXI] [get_bd_intf_pins bert_all_0/m_axi_gmem7]
  connect_bd_intf_net -intf_net bert_all_0_m_axi_gmem8 [get_bd_intf_pins axi_clock_converter_8/S_AXI] [get_bd_intf_pins bert_all_0/m_axi_gmem8]
  connect_bd_intf_net -intf_net bert_all_0_m_axi_gmem9 [get_bd_intf_pins axi_clock_converter_9/S_AXI] [get_bd_intf_pins bert_all_0/m_axi_gmem9]
  connect_bd_intf_net -intf_net ddr4_0_C0_DDR4 [get_bd_intf_ports ddr4_sdram_c1_062] [get_bd_intf_pins ddr4_0/C0_DDR4]
  connect_bd_intf_net -intf_net default_250mhz_clk1_1 [get_bd_intf_ports default_250mhz_clk1] [get_bd_intf_pins ddr4_0/C0_SYS_CLK]
  connect_bd_intf_net -intf_net pcie_refclk_1 [get_bd_intf_ports pcie_refclk] [get_bd_intf_pins util_ds_buf/CLK_IN_D]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins smartconnect_0/M00_AXI] [get_bd_intf_pins smartconnect_1/S05_AXI]
  connect_bd_intf_net -intf_net smartconnect_1_M00_AXI [get_bd_intf_pins axi_smc/S01_AXI] [get_bd_intf_pins smartconnect_1/M00_AXI]
  connect_bd_intf_net -intf_net xdma_0_M_AXI [get_bd_intf_pins axi_smc/S00_AXI] [get_bd_intf_pins xdma_0/M_AXI]
  connect_bd_intf_net -intf_net xdma_0_M_AXI_LITE [get_bd_intf_pins xdma_0/M_AXI_LITE] [get_bd_intf_pins xdma_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net xdma_0_axi_periph_M00_AXI [get_bd_intf_pins bert_all_0/s_axi_control] [get_bd_intf_pins xdma_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net xdma_0_pcie_mgt [get_bd_intf_ports pci_express_x1] [get_bd_intf_pins xdma_0/pcie_mgt]

  # Create port connections
  connect_bd_net -net clk_slow_axi_clk_out1 [get_bd_pins axi_clock_converter_0/m_axi_aclk] [get_bd_pins axi_clock_converter_1/m_axi_aclk] [get_bd_pins axi_clock_converter_2/m_axi_aclk] [get_bd_pins axi_clock_converter_3/m_axi_aclk] [get_bd_pins axi_clock_converter_4/m_axi_aclk] [get_bd_pins axi_clock_converter_5/m_axi_aclk] [get_bd_pins axi_clock_converter_6/m_axi_aclk] [get_bd_pins axi_clock_converter_7/m_axi_aclk] [get_bd_pins axi_clock_converter_8/m_axi_aclk] [get_bd_pins axi_clock_converter_9/m_axi_aclk] [get_bd_pins axi_smc/aclk2] [get_bd_pins clk_slow_axi/clk_out1] [get_bd_pins reset_slow_axi/slowest_sync_clk] [get_bd_pins smartconnect_0/aclk] [get_bd_pins smartconnect_1/aclk]
  connect_bd_net -net clk_slow_axi_locked [get_bd_pins clk_slow_axi/locked] [get_bd_pins reset_slow_axi/dcm_locked]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins axi_clock_converter_0/s_axi_aclk] [get_bd_pins axi_clock_converter_1/s_axi_aclk] [get_bd_pins axi_clock_converter_2/s_axi_aclk] [get_bd_pins axi_clock_converter_3/s_axi_aclk] [get_bd_pins axi_clock_converter_4/s_axi_aclk] [get_bd_pins axi_clock_converter_5/s_axi_aclk] [get_bd_pins axi_clock_converter_6/s_axi_aclk] [get_bd_pins axi_clock_converter_7/s_axi_aclk] [get_bd_pins axi_clock_converter_8/s_axi_aclk] [get_bd_pins axi_clock_converter_9/s_axi_aclk] [get_bd_pins bert_all_0/ap_clk] [get_bd_pins clk_kernel/clk_out1] [get_bd_pins reset_kernel/slowest_sync_clk] [get_bd_pins xdma_0_axi_periph/M00_ACLK] [get_bd_pins xdma_0_axi_periph/M01_ACLK] [get_bd_pins xdma_0_axi_periph/M02_ACLK]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins clk_kernel/locked] [get_bd_pins reset_kernel/dcm_locked]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk [get_bd_pins axi_smc/aclk] [get_bd_pins ddr4_0/c0_ddr4_ui_clk] [get_bd_pins rst_ddr4_0_300M/slowest_sync_clk]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk_sync_rst [get_bd_pins ddr4_0/c0_ddr4_ui_clk_sync_rst] [get_bd_pins rst_ddr4_0_300M/ext_reset_in]
  connect_bd_net -net kernel_reset_peripheral_aresetn [get_bd_pins axi_clock_converter_0/s_axi_aresetn] [get_bd_pins axi_clock_converter_1/s_axi_aresetn] [get_bd_pins axi_clock_converter_2/s_axi_aresetn] [get_bd_pins axi_clock_converter_3/s_axi_aresetn] [get_bd_pins axi_clock_converter_4/s_axi_aresetn] [get_bd_pins axi_clock_converter_5/s_axi_aresetn] [get_bd_pins axi_clock_converter_6/s_axi_aresetn] [get_bd_pins axi_clock_converter_7/s_axi_aresetn] [get_bd_pins axi_clock_converter_8/s_axi_aresetn] [get_bd_pins axi_clock_converter_9/s_axi_aresetn] [get_bd_pins bert_all_0/ap_rst_n] [get_bd_pins reset_kernel/peripheral_aresetn] [get_bd_pins xdma_0_axi_periph/M00_ARESETN] [get_bd_pins xdma_0_axi_periph/M01_ARESETN] [get_bd_pins xdma_0_axi_periph/M02_ARESETN]
  connect_bd_net -net pcie_perstn_1 [get_bd_ports pcie_perstn] [get_bd_pins xdma_0/sys_rst_n]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins ddr4_0/sys_rst]
  connect_bd_net -net reset_kernel1_interconnect_aresetn [get_bd_pins axi_clock_converter_0/m_axi_aresetn] [get_bd_pins axi_clock_converter_1/m_axi_aresetn] [get_bd_pins axi_clock_converter_2/m_axi_aresetn] [get_bd_pins axi_clock_converter_3/m_axi_aresetn] [get_bd_pins axi_clock_converter_4/m_axi_aresetn] [get_bd_pins axi_clock_converter_5/m_axi_aresetn] [get_bd_pins axi_clock_converter_6/m_axi_aresetn] [get_bd_pins axi_clock_converter_7/m_axi_aresetn] [get_bd_pins axi_clock_converter_8/m_axi_aresetn] [get_bd_pins axi_clock_converter_9/m_axi_aresetn] [get_bd_pins reset_slow_axi/interconnect_aresetn] [get_bd_pins smartconnect_0/aresetn] [get_bd_pins smartconnect_1/aresetn]
  connect_bd_net -net rst_ddr4_0_300M_peripheral_aresetn [get_bd_pins ddr4_0/c0_ddr4_aresetn] [get_bd_pins rst_ddr4_0_300M/peripheral_aresetn]
  connect_bd_net -net util_ds_buf_IBUF_DS_ODIV2 [get_bd_pins util_ds_buf/IBUF_DS_ODIV2] [get_bd_pins xdma_0/sys_clk]
  connect_bd_net -net util_ds_buf_IBUF_OUT [get_bd_pins util_ds_buf/IBUF_OUT] [get_bd_pins xdma_0/sys_clk_gt]
  connect_bd_net -net xdma_0_axi_aclk [get_bd_pins axi_smc/aclk1] [get_bd_pins clk_kernel/clk_in1] [get_bd_pins clk_slow_axi/clk_in1] [get_bd_pins xdma_0/axi_aclk] [get_bd_pins xdma_0_axi_periph/ACLK] [get_bd_pins xdma_0_axi_periph/S00_ACLK]
  connect_bd_net -net xdma_0_axi_aresetn [get_bd_pins axi_smc/aresetn] [get_bd_pins clk_kernel/resetn] [get_bd_pins clk_slow_axi/resetn] [get_bd_pins reset_kernel/ext_reset_in] [get_bd_pins reset_slow_axi/ext_reset_in] [get_bd_pins xdma_0/axi_aresetn] [get_bd_pins xdma_0_axi_periph/ARESETN] [get_bd_pins xdma_0_axi_periph/S00_ARESETN]

  # Create address segments
  assign_bd_address -offset 0x80000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces bert_all_0/m_axi_gmem0] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
  assign_bd_address -offset 0x80000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces bert_all_0/m_axi_gmem1] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
  assign_bd_address -offset 0x80000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces bert_all_0/m_axi_gmem2] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
  assign_bd_address -offset 0x80000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces bert_all_0/m_axi_gmem3] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
  assign_bd_address -offset 0x80000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces bert_all_0/m_axi_gmem4] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
  assign_bd_address -offset 0x80000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces bert_all_0/m_axi_gmem5] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
  assign_bd_address -offset 0x80000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces bert_all_0/m_axi_gmem6] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
  assign_bd_address -offset 0x80000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces bert_all_0/m_axi_gmem7] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
  assign_bd_address -offset 0x80000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces bert_all_0/m_axi_gmem8] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
  assign_bd_address -offset 0x80000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces bert_all_0/m_axi_gmem9] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
  assign_bd_address -offset 0x80000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI] [get_bd_addr_segs ddr4_0/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] -force
  assign_bd_address -offset 0x00000000 -range 0x00001000 -target_address_space [get_bd_addr_spaces xdma_0/M_AXI_LITE] [get_bd_addr_segs bert_all_0/s_axi_control/reg0] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""
