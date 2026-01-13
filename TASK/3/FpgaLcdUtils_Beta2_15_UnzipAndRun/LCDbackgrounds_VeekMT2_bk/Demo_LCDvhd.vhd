-- This VHDL file describes the  circuit identical with Demo_LCD.bdf block diagram schematic
-------------------------------------------------------------
library ieee; use ieee.std_logic_1164.all; 
library work;
use work.LCDpackV2.all;

entity Demo_LCDvhd is 
	port(CLOCK_50 :  in std_logic:='0';  -- input clock signal 50 MHz 
		KEY :  in std_logic_vector(0 TO 0):="0"; -- asynchronous clear negative, connected to KEY[0]
	  -- Signals of the VeekMT2 LCD panel
		LCD_DCLK, LCD_DE, LCD_DIM, LCD_DITH, LCD_MODE, LCD_POWER_CTL:  out std_logic:='0';
		LCD_RSTB,LCD_SHLR,LCD_UPDN, LCD_HSD, LCD_VSD :  out std_logic:='0';
		LCD_B,LCD_G, LCD_R :  out std_logic_vector(7 downto 0):=(others=>'0');
		LEDG :  out std_logic_vector(8 downto 0) :=(others=>'0');
		LEDR :  out std_logic_vector(17 downto 0):=(others=>'0')	);
end entity;

architecture behavioral OF Demo_LCDvhd is 

component VeekMT2_LCDgenV2 is
	port (CLOCK_50 : in std_logic; -- input clock signal 50 MHz 
	ACLRN : in std_logic; -- asynchronous clear negative, connected to KEY[0] 
	xcolumn  : out xy_t;	 -- order number of actual pixel-column, see note 1 below
	yrow     : out xy_t;   -- order number of actual pixel-row
   XEND_N   : out std_logic;	-- '0' pulse at the end of x-column 
	YEND_N   : out std_logic;   -- '0' pulse at the end of y-row
	LCD_DE   : out std_logic;   -- DataEnable control signal of LCD controller
	LCD_DCLK : out std_logic;   -- LCD pixel clock, 33 MHz, see note 2 below
	CLRN    : out std_logic:='0');    -- output of phase-locked loop, after start-up, it changes from 0 -> 1 and remains in 1
end component;

component LCDlogic0 is
    port(xcolumn, yrow  : in  xy_t; -- x, y-coordinate of pixel (column, row indexes)
         XEND_N   : in  std_logic; -- 32.2 kHz'; '0' only when xcolumn=XCOLUMN_MAX, otherwise '1;
         YEND_N   : in  std_logic; -- 61.4 Hz; '0' only when max yrow=YROW_MAX, otherwise '1',
         LCD_DE   : in  std_logic;   -- DataEnable indicates the visible part of LCD
         LCD_DCLK : in  std_logic; -- 33 MHz exactly; LCD data clock
         RGBcolor : out RGB_t); --  defined in LCDpackV2; RGB_t = std_logic_vector(23 downto 0)
end component;

component VeekMT2_LCDregV2 is 
port (
	RGBcolor : in RGB_t; -- input colors
	LCD_DE_in, LCD_DCLK_in : in std_logic;   -- inputs of LCD controller signals
	CLRN  : in std_logic; --synchronous clear negative
  -- 	  -- Signals of LCD panel
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
	LCD_HSD: out std_logic; -- used in HS synchronization
	LCD_VSD: out std_logic); -- used in VS synchronization
end component;

signal	wireXEND, wireYEND,	wireDE, wireDCLK :  std_logic:='0';
signal	wirex, wirey :  xy_t:=XY_ZERO;
signal	wireCLRN :  std_logic:='0';
signal	wireRGB :  std_logic_vector(23 downto 0):=(others=>'0');


begin 
LEDG <= (others=>'0');LEDR <= (others=>'0');

iLCDgenerator : VeekMT2_LCDgenV2
port MAP(CLOCK_50 => CLOCK_50, ACLRN => KEY(0),
		 XEND_N => wireXEND, YEND_N => wireYEND,
		 LCD_DE => wireDE, LCD_DCLK => wireDCLK, CLRN => wireCLRN,
		 xcolumn => wirex, yrow => wirey);


iLCDlogic : lcdlogic0
port MAP(XEND_N => wireXEND, YEND_N => wireYEND, LCD_DE => wireDE, LCD_DCLK => wireDCLK, 
         xcolumn => wirex, yrow => wirey, RGBcolor => wireRGB);


iLCDreg : VeekMT2_LCDregV2
port MAP(LCD_DE_in => wireDE, LCD_DCLK_in => wireDCLK, CLRN => wireCLRN, RGBcolor => wireRGB,
		 LCD_DCLK => LCD_DCLK, LCD_DE => LCD_DE, LCD_DIM => LCD_DIM, LCD_DITH => LCD_DITH,
		 LCD_MODE => LCD_MODE,LCD_POWER_CTL => LCD_POWER_CTL,
		 LCD_RSTB => LCD_RSTB,LCD_SHLR => LCD_SHLR, LCD_UPDN => LCD_UPDN, 
		 LCD_HSD => LCD_HSD, LCD_VSD => LCD_VSD,
		 LCD_B => LCD_B, LCD_G => LCD_G, LCD_R => LCD_R);

end architecture;