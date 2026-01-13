@ECHO OFF
rem We specify the following set-commands as temporary 
SETLOCAL
rem Testbench filename is without extension
set TBNAME=testbenchV2_LCDlogic
rem Files have extensions and relative paths. List them in the proper compilation order!
rem IMPORTANT: H_Star.vhd must be compiled BEFORE LCDlogic0.vhd
set FILES=../LCDpackV2.vhd ../H_Star.vhd ../LCDlogic0.vhd
rem Simulation running time, 1 frame needs 16.6 ms, 20 ms is a safe guard 
set SIMTIME=20ms
rem Temporary moving mingw64 to top of PATH 
set PATH=C:\msys64\mingw64\bin\;%PATH%
rem GHDL compiles for VHDL-2008
set GHDL_FLAGS=-fsynopsys --std=08
@ECHO ON
ghdl.exe -a %GHDL_FLAGS% %FILES% ../%TBNAME%.vhd 
@IF ERRORLEVEL 1 GOTO BAT-END
ghdl.exe -e %GHDL_FLAGS% %TBNAME% 
@IF ERRORLEVEL 1 GOTO BAT-END
ghdl.exe -r %GHDL_FLAGS% %TBNAME% --stop-time=%SIMTIME%
:BAT-END
