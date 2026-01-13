@ECHO OFF
rem We specify the following sets as temporary 
SETLOCAL
set SIMNAME=MySim
rem Temporary moving mingw64 to top
set PATH=C:\msys64\mingw64\bin\;%PATH%
IF exist ./%SIMNAME%.vcd (
    rem Run gtkwave and continue batch commands
    start gtkwave ./%SIMNAME%.vcd 
 ) ELSE ( 
echo There's nothing to view. First, the compilation must exit successfully.
)
