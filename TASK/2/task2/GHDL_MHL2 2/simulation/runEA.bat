@ECHO OFF
rem We specify the following set commands as temporary 
SETLOCAL
rem Testbench filename is without extension
set TBNAME=testbench_EA
rem Files used by the testbench have extensions and relative paths
set FILES=../MorseEA.vhd
rem Simulation running time, ns=nanosecond 
set SIMTIME=400ns
rem Our name of simulation temporary results
set SIMNAME=MySim

rem Temporary moving mingw64 to top of PATH
set PATH=C:\msys64\mingw64\bin\;%PATH%
rem Compile for VHDL-2008
set GHDL_FLAGS=-fsynopsys --std=08
rem We use %SIMNAME%.vcd as the flag of succesful compilation
if exist %SIMNAME%.vcd del %SIMNAME%.vcd
rem Analyse and create object files
@ECHO ON

ghdl.exe -a %GHDL_FLAGS% %FILES% ../%TBNAME%.vhd 
@IF ERRORLEVEL 1 GOTO BAT-END
ghdl.exe -e %GHDL_FLAGS% %TBNAME% 
@IF ERRORLEVEL 1 GOTO BAT-END
ghdl.exe -r %GHDL_FLAGS% %TBNAME% --vcd=%SIMNAME%.vcd --stop-time=%SIMTIME%
:BAT-END