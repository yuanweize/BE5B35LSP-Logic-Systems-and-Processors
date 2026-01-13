-- testbenchV2_LCDlogic version V2.2 (Sept 27, 2024) - simplified and a minor error was corrected.
-------------------------------------------------------------
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta], GNU General Public License
-------------------------------------------------------------
-- Notes:
-- 1. ***ToDo changes are now only at the BEGINING and the END of the file !!!!!

-- 2. In Quartus, you can test this code by the "Start Analysis & Synthesis" button, 
--    but the full compilation returns: Error (10533): VHDL Wait Statement error,
--    because testbench codes are not synthesizable. They are intended for ModelSim.

-- 3. Its stores the result into the TEXT FILE, see ***ToDo 1, 
-- which can be opened by LCDTestbenchViewer version 3 and later/
-----------------------------------

library ieee, work;
use ieee.std_logic_1164.all; use ieee.numeric_std.all;
use ieee.std_logic_textio.all; use std.textio.all;
use work.LCDpackV2.all;

entity testbenchV2_LCDlogic is --testbench entity is always without any inputs/outputs.
end entity;

architecture testbench of testbenchV2_LCDlogic is
    ---------------------------------------------------------------------------------------
    -- ***ToDo 1 of 2 (the next ToDo is at the end of this file)
    --=====================================================================================
    --- *** Setting of simulation options **** 
    -- 
    constant FILE_NAME : string := "C:/SPS/testbenchLCD.txt";
    -- The testbench result filename in Unix style, i.e., use / instead of \ (backslashes) and no spaces. 
    -- The path must exist!!! The file will be created or overwritten.

    constant ENABLE_COMPRESSION : boolean := TRUE;
    -- The compression reduces the result size and accelerates simulations, but it writes only complete lines. 
    -- Disable the compression, if you want to see immediate pixels after a breakpoint.  

   constant SINGLE_FRAME : boolean := TRUE;
    --  On TRUE, the simulation is terminated after the first frame.
    --  On FALSE, the simulation terminates after storing COUNT_OF_FRAMES. 
    --  In case of more frames, it is recommended ENABLE_COMPRESSION=TRUE to prevent huge file sizes.
    
    constant COUNT_OF_FRAMES : positive := 32;
    -- The count of stored frames is active only if SINGLE_FRAME=FALSE, otherwise it is ignored.

    --------------------------------------------------------------
    -- Internal signals
    ------------------------------
    signal CLK_33MHz       : std_logic:='0';
    constant CLOCK_PERIOD  : time      := 30 ns; -- 33 MHz
    signal beginWriting    : boolean:=FALSE; -- write to file is allowed after power-up

    -- signals that correspond to input ports of VEEK-MT2
    signal LCD_DCLK          : std_logic               := '0'; -- LCD pixel clock, 33 MHz
    signal LCD_DE            : std_logic               := '0'; -- DataEnable control signal of LCD controller
    signal CLRN              : std_logic               := '0'; -- Power-up initialization
    signal RGBcolor          : RGB_t                   := BLACK;

    ---------------------------------------------------------------------------------

    -- connection signals
    constant XYZERO      : unsigned(xy_t'range)  := (others => '0');
    signal xcolumn, yrow  : xy_t                 := XYZERO;
    signal XEND_N, YEND_N : std_logic            := '1';

begin

    -- Clock process with 50% duty cycle is generated here.
    clk_process : process
    begin
        CLK_33MHz <= '0';
        wait for CLOCK_PERIOD / 2;      --for 50 % of CLK_33MHz period is'0'.
        CLK_33MHz <= '1';
        wait for CLOCK_PERIOD / 2;      --for next 50% of CLK_33MHz period is '1'.
    end process;

    LCD_DCLK <= CLK_33MHz;

    -- Clear process keeps CLRN='0' for 3 CLOCK_PERIOD.
    clear_process : process
    begin
        beginWriting <= FALSE; CLRN<='0';
        wait for 3*CLOCK_PERIOD;
        beginWriting <= TRUE; CLRN<='1';   
        wait;           -- terminate process.
    end process;

    stimuls : process(CLK_33MHz, beginWriting)
        file outfile        : TEXT;
        variable outline    : line;     --line
        variable fstatus    : FILE_OPEN_STATUS;

        subtype data_t is RGB_t; -- for results
        variable data, lastdata : data_t := (others => '0'); -- RGB

        variable iswrite           : boolean := FALSE;
        constant HEADER            : string    := "## LCD Testbench result - 1024x525 full LCD frame";
        constant NUMHEADER         : string    := "##=";
        variable repeat_counter    : integer   := 0;
        variable counter_of_frames : integer   := 0;

        procedure FLUSH_COMPRESSION(repeatCounter : inout integer) is
        begin
            if repeatCounter > 0 then
                write(outline, '*' & integer'image(repeatCounter) & LF);
                repeatCounter := 0;
            end if;
        end procedure;
        function boolean2std_logic(cond : BOOLEAN) return std_logic is
        begin
            if cond then return '1'; else return '0'; end if;
        end function;
        -- the counters are initialized to position before the 1st frame after power-up
        -- It allows genarating XEND_N and YEND_N signals at the beginings of simulations
        variable horizontal : unsigned(xcolumn'RANGE) := (3=>'0',others => '1'); -- ="1111110111"=1015
        variable vertical   : unsigned(yrow'RANGE)    := to_unsigned(YROW_MAX, yrow'LENGTH); -- yrow counter
    begin -- process
        ---------- 1st part of LCD generator--------------------------------------------------
        if falling_edge(CLK_33MHz) then
            if horizontal >= XCOLUMN_MAX then
                if vertical < YROW_MAX then  vertical := vertical + 1;
                else vertical := XYZERO;
                end if;
            end if;
            horizontal := horizontal + 1; -- unsigned counter overflows at its max value 
        end if;

        ------------ Storing results ---------------------------------------------		
        if rising_edge(CLK_33MHz) then
           if not beginWriting then
            iswrite        := FALSE;
            repeat_counter := 0;
           else
            -------------------------------------------------------------------------
            if ( not iswrite and LCD_DE = '1') then -- frame is active
                file_open(fstatus, outfile, FILE_NAME, WRITE_MODE); -- file name
                iswrite           := TRUE;
                counter_of_frames := 0;
                repeat_counter    := 0;
                if fstatus = OPEN_OK then
                    write(outline, HEADER);
                    writeline(outfile, outline);
                end if;
            end if;
            if iswrite and fstatus = OPEN_OK then
                if (xcolumn = XYZERO) then
                    FLUSH_COMPRESSION(repeat_counter);
                    write(outline, NUMHEADER); -- we are adding mark for synchronization checks.
                    write(outline, to_integer(xcolumn));
                    write(outline, ',');
                    write(outline, to_integer(yrow));
                    writeline(outfile, outline);
                    lastdata := (others => '0');
                end if;
                -- LCD_DEN, XEND and YEND are not stored, because they are always determined from xcolumn and yrow values
                data := RGBcolor;
                if data = lastdata then
                    if ENABLE_COMPRESSION then
                        repeat_counter := repeat_counter + 1;
                    else
                        write(outline, '*');  -- previous value repeates
                        writeline(outfile, outline);
                    end if;
                else
                    FLUSH_COMPRESSION(repeat_counter);
                    write(outline, integer'image(to_integer(unsigned(data))));
                    lastdata := data;
                    writeline(outfile, outline);
                end if;

                if XEND_N = '0' and YEND_N = '0' then -- the last pixel of a current frame
                    if repeat_counter > 0 then
                        FLUSH_COMPRESSION(repeat_counter);
                        writeline(outfile, outline);
                    end if;
                    if SINGLE_FRAME then
                        file_close(outfile);
                        iswrite := FALSE;
                        assert false report LF&LF&":-) OK end of SINGLE frame simulation."&LF
                        severity failure;
                      else
                        counter_of_frames := counter_of_frames + 1;
                        if counter_of_frames > COUNT_OF_FRAMES then
                            assert false
                            report LF&LF&":-) OK end of simulation: " & integer'image(COUNT_OF_FRAMES) & " frames were stored."&LF
                            severity failure;
                        else
                            report "Stored frame "&integer'image(counter_of_frames)&" of "&integer'image(COUNT_OF_FRAMES);
                        end if;
                    end if;
                end if;
                if iswrite and fstatus /= OPEN_OK then
                    assert false report "File status is not OPEN_OK"
                    severity failure;
                    file_close(outfile);
                    iswrite := FALSE;
                end if;
              end if; -- if iswrite and fstatus = OPEN_OK then
          end if; --if not beginWriting then
          
            ----------------- 2nd part of LCD_generator  ------------------------	   
            XEND_N  <= boolean2std_logic(horizontal < XCOLUMN_MAX);
            YEND_N  <= boolean2std_logic(vertical < YROW_MAX);
            LCD_DE  <= boolean2std_logic((horizontal < LCD_WIDTH) and (vertical < LCD_HEIGHT));
            xcolumn <= horizontal;
            yrow    <= vertical;
        end if; -- if rising_edge(CLK_33MHz)---------------------------------------------------
     end process stimuls;

    --------------------------------------------------------------------------------------
    -- ***ToDo 2 of 2: Adjust to your own component name
	 --------------------------------------------------------------------------------------
	 iLCDLogic : entity work.LCDlogic0
	     port map(
		   xcolumn=>xcolumn, yrow=>yrow, XEND_N=>XEND_N, YEND_N=>YEND_N, 
         LCD_DE=>LCD_DE, LCD_DCLK=>LCD_DCLK,
         RGBcolor=>RGBcolor);
	
end architecture testbench;
