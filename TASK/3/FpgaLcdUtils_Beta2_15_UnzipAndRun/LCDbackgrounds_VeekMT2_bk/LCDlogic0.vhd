-------------------------------------------------------------
-- LCD image created by logic
-------------------------------------------------------------

library ieee, work; use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; -- for integer and unsigned types
use work.LCDpackV2.all;
entity LCDlogic0 is
    port(xcolumn, yrow  : in  xy_t  := XY_ZERO; -- x, y-coordinate of pixel (column, row indexes)
           XEND_N   : in  std_logic := '0'; -- 32.2 kHz'; '0' only when xcolumn=XCOLUMN_MAX, otherwise '1;
           YEND_N   : in  std_logic := '0'; -- 61.4 Hz; '0' only when max yrow=YROW_MAX, otherwise '1',
           LCD_DE   : in  std_logic := '0';   -- DataEnable indicates the visible part of LCD
           LCD_DCLK : in  std_logic := '0'; -- 33 MHz exactly; LCD data clock
          RGBcolor : out RGB_t); --  defined in LCDpackV2; RGB_t = std_logic_vector(23 downto 0)
end entity;

architecture behavioral of LCDlogic0 is

   -- circle geometry
   constant CX1 : integer := LCD_WIDTH / 2;
   constant CY1 : integer := -180;
   constant CX2 : integer := LCD_WIDTH / 2;
   constant CY2 : integer := 640;
   constant R   : integer := 480;

   -- H_Star ROM (High star) 
   constant IMG_W : integer := 143;  -- star width
   constant IMG_H : integer := 144;  -- star height
   constant HSTAR_X0 : integer := 600;  -- x position of higher star
   constant HSTAR_Y0 : integer := 50;   -- y position of higher star
   constant LSTAR_X0 : integer := 40;   -- x position of lower star
   constant LSTAR_Y0 : integer := 280;  -- y position of lower star
   
   signal rom_addr : std_logic_vector(14 downto 0);
   signal rom_q    : std_logic_vector(1 downto 0);

  begin -- architecture
  
  -- H_Star ROM instance 
  HSTAR_ROM : entity work.H_Star
    port map (
      clock   => LCD_DCLK,
      address => rom_addr,
      q       => rom_q
    );

LSPimage : process( xcolumn, yrow, LCD_DE,rom_q)
-- In any process, we prefer variables. They must be initialized in the code!!!
-- The values after definitions are mainly for simulations. 
   variable RGB :RGB_t; 
   variable x : integer  range 0 to XCOLUMN_MAX:=1023; 
   variable y : integer  range 0 to YROW_MAX:=524; 
   variable dx1, dy1, dx2, dy2 : integer;
   variable in1, in2 : boolean;
   -- Star IMG variables
   variable hstar_x, hstar_y : integer;
   variable hstar_in : boolean;
   variable lstar_x, lstar_y : integer;
   variable lstar_in : boolean;

   begin
      x := to_integer(xcolumn);
      y := to_integer(yrow); -- convert unsigned inputs to integers
      
      ---------- our image -------------------------
      -- draw background circles
      dx1 := x - CX1;
      dy1 := y - CY1;
      dx2 := x - CX2;
      dy2 := y - CY2;
      -- check inclusion in circles
      in1 := (dx1*dx1 + dy1*dy1 <= R*R);
      in2 := (dx2*dx2 + dy2*dy2 <= R*R);
      -- set colors based on circle inclusion
      if in1 and in2 then
         RGB := C_MIDDLE;
      elsif not (in1 and in2) and y<230 then
         RGB := C_UPPER;
      else
         RGB := C_LOWER;
      end if;
      
      ------------------------------------------------------------
      -- Check both stars and determine which ROM address to read
      hstar_x := x - HSTAR_X0;
      hstar_y := y - HSTAR_Y0;
      hstar_in := (hstar_x >= 0) and (hstar_x < IMG_W) and 
                  (hstar_y >= 0) and (hstar_y < IMG_H);
      
      lstar_x := x - LSTAR_X0;
      lstar_y := y - LSTAR_Y0;
      lstar_in := (lstar_x >= 0) and (lstar_x < IMG_W) and 
                  (lstar_y >= 0) and (lstar_y < IMG_H);
      
      -- Set ROM address
      if hstar_in then
        rom_addr <= std_logic_vector(to_unsigned(hstar_y * IMG_W + hstar_x, rom_addr'length));
      elsif lstar_in then
        -- Rotate L_Star 90 degrees clockwise: x' = y, y' = IMG_W-1-x
        rom_addr <= std_logic_vector(to_unsigned((IMG_W - 1 - lstar_x) * IMG_W + lstar_y, rom_addr'length));
      else
        rom_addr <= (others => '0');
      end if;

      -- Apply star overlay (non-background color pixels only)
      -- Transparent color code: "01" (light blue for H_Star, dark blue for L_Star after swap)
      if (hstar_in or lstar_in) and rom_q /= "01" then
        RGB := Star_Parse(rom_q, is_lower => lstar_in);
      end if;
      
      ------------------------------------------------------------
      -- auxiliary clipping to LCD visible area
      if LCD_DE = '0' then  
         RGB  := BLACK; 
      end if;

      RGBcolor <= RGB; -- assigning to output at the end
   end process;
end architecture;


 