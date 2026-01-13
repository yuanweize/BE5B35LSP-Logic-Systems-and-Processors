@README version September 16, 2025 - the list of default project files
--------------------------------
[Home page of the templates: https://dcenet.fel.cvut.cz/edu/fpga/guides.aspx]
[FPGA-LCD Tools:  https://github.com/cvut/FPGA-LCD_Utils]

Demo_LCD - top-level entity as Block Diagram Schematic
Demo_LCDvhd - identical with Demo_LCD, but all in VHDL

LCDlogic0.vdh - the prototype of logic image templates
--------- packages --------------------------------


testbenchV2_LCDlogic.vhd - it creates text file for Testbench Viewer from FPGA-LCD Utilis, https://github.com/cvut/FPGA-LCD_Utils 
simulation/runLCD.bat  -- batch file for running simulation in GHDL


-------------------------------------------------------------
LCDpackV2.vhd -- VHDL package shared definition, V2.1. The packages are explained in:
--cz: kapitola 7 v  https://dcenet.fel.cvut.cz/edu/fpga/doc/UvodDoVHDL1_concurrent_V20.pdf
--eng: Chapter 7 in https://dcenet.fel.cvut.cz/edu/fpga/doc/CircuitDesignWithVHDL_dataflow_and_structural_eng_V10.pdf 
---------------------------------------------------------------

LSP.qpf  and LSP.qfs - Quartus project files

=================================================================
*** VeekMT2 files

VeekMT2_LCDgenV2.vhd - LCD generator
VeekMT2_LCDregV2.vhd - LCD register

=============== always copy them into each LCD Quartus project ====================
VeekMT2_PinAssignments.csv - Pin Assignments of Terasic VeekMT2 board

*** TimeQuest Analyzer files 

VeekMT2.sdc - basic definitions for TimeQuest Analyzer
VeekMT2_LCD.sdc - added definition for VeekMT2_LCDgenV2 with the instance name "iLCDgenerator"

