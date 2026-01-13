-------------------------------------------------------------
-- CTU-FFE Prague, Dept. of Control Eng. [Richard Susta]
-- Published under GNU General Public License
-------------------------------------------------------------

library ieee, work;
use ieee.std_logic_1164.all; use ieee.numeric_std.all;       -- type integer and unsigned
use work.LCDpackV2.all;


entity VeekMT2_LCDregV2 is 
port (
	RGBcolor : in RGB_t; -- input colors
	LCD_DE_in, LCD_DCLK_in : in std_logic;   -- inputs of LCD controller signals
	CLRN  : in std_logic; --synchronous clear negative
	
	LCD_R, LCD_G, LCD_B : out color_t;	-- output 8-bit colors
	LCD_DCLK : out std_logic; -- data clock
	LCD_DE: out std_logic; -- data input enable, when LCD_MODE=1
	LCD_DIM : out std_logic; -- backlight on
	LCD_DITH : out std_logic; -- if 1, disable internal dithering   
	LCD_MODE: out std_logic;  -- if 1, DE mode (HSD, VSD must be 1), if 0, SYNC mode (DE must be 0) 
	LCD_POWER_CTL: out std_logic; --power on/off
	LCD_RSTB: out std_logic; -- Global reset pin, active low, normally pull high.
	LCD_SHLR: out std_logic; -- Left/Right direction, 1 - left to right, 0 right to left
	LCD_UPDN: out std_logic; -- Up/Down selection, 0 up to down, 1 down to up
	LCD_HSD: out std_logic; -- use in HS synchronization
	LCD_VSD: out std_logic -- use in VS synchronization
);
end entity VeekMT2_LCDregV2;


architecture driver of VeekMT2_LCDregV2 is

signal pllreset : std_logic;

constant ZERO : std_logic_vector(color_t'RANGE) := (others=>'0');

begin
   LCD_DCLK <= LCD_DCLK_in;

   LCD_MODE<='1'; -- DE mode - we utilize synchronization by DE=DataEnable
   LCD_HSD<='1'; LCD_VSD<='1'; --the setting is required in DE mode=1	
   LCD_RSTB<='1'; -- no reset
   LCD_POWER_CTL<='1'; -- power is on
   LCD_SHLR<='1'; --from left to right	
   LCD_UPDN<='0'; --from up to down	
   LCD_DIM <= '1'; -- backlight ON	
   LCD_DITH<= '1'; -- no internal dithering
	
	process(LCD_DCLK_in, RGBcolor)
	variable RGB : RGB_record;
    begin
      RGB := RGB2record(RGBcolor); -- splitting RGBcolor to RGB_type
      if (rising_edge(LCD_DCLK_in)) then
			if CLRN='1' and LCD_DE_in='1' then -- no clear and DataEnable
				LCD_R <= RGB.R;	LCD_G <= RGB.G;	LCD_B <= RGB.B;  
			else
			    -- Used LCD requires black color outside of visible range
				LCD_R <= ZERO;	LCD_G <= ZERO;	LCD_B <= ZERO; 
			end if;
			LCD_DE <= LCD_DE_in and CLRN;
		end if;
	end process;
	
end architecture driver;
