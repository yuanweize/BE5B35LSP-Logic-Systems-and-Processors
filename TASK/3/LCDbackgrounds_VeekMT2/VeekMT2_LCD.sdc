## Generated SDC file "VeekMT2_LCD.sdc"

## Copyright (C) 1991-2013 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

## DATE    "Tue Feb 14 20:38:09 2023"

##
## DEVICE  "EP4CE115F29C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {CLOCK_50} -period 20.000  [get_ports {CLOCK_50}]
create_clock -name {LCD_DCLK} -period "33 MHz"  [get_ports {LCD_DCLK}]
create_clock -period "0.16 MHZ" [get_ports TOUCH_I2C_SCL]


#**************************************************************
# Create Generated Clock
#**************************************************************
derive_pll_clocks
create_generated_clock -name {iLCDgenerator|iLCDpll|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {iLCDgenerator|iLCDpll|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 33 -divide_by 50 -master_clock {CLOCK_50} [get_pins {iLCDgenerator|iLCDpll|altpll_component|auto_generated|pll1|clk[0]}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {iLCDgenerator|iLCDpll|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {iLCDgenerator|iLCDpll|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {iLCDgenerator|iLCDpll|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {iLCDgenerator|iLCDpll|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {iLCDgenerator|iLCDpll|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {LCD_DCLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {iLCDgenerator|iLCDpll|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {LCD_DCLK}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {iLCDgenerator|iLCDpll|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {LCD_DCLK}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {iLCDgenerator|iLCDpll|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {LCD_DCLK}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {iLCDgenerator|iLCDpll|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {iLCDgenerator|iLCDpll|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {iLCDgenerator|iLCDpll|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {iLCDgenerator|iLCDpll|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {iLCDgenerator|iLCDpll|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {LCD_DCLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {iLCDgenerator|iLCDpll|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {LCD_DCLK}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {iLCDgenerator|iLCDpll|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {LCD_DCLK}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {iLCDgenerator|iLCDpll|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {LCD_DCLK}] -hold 0.080  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {VirtualCLK}]  50.000 [get_ports {KEY[0]}]


#**************************************************************
# Set Output Delay
#**************************************************************

#set_output_delay -clock  "LCD_DCLK" 1.0  [get_ports {LCD_R[*]}] 
#set_output_delay -clock  "LCD_DCLK" 1.0  [get_ports {LCD_G[*]}] 
#set_output_delay -clock  "LCD_DCLK" 1.0  [get_ports {LCD_B[*]}] 
#set_output_delay -clock  "LCD_DCLK" 1.0  [get_ports LCD_VSD] 
#set_output_delay -clock  "LCD_DCLK" 1.0  [get_ports LCD_HSD] 



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

