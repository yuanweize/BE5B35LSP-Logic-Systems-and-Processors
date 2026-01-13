library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all;
library work;
entity testbench_MHL2 is end entity;

architecture rtl of testbench_MHL2 is
signal x:unsigned(5 downto 0):=(others=>'0');
signal y, stop : std_logic:='0';

begin -- architecture, we implement all only by Concurrent Statements
   imhl2 : entity work.MorseMHL2 port map (x,y,stop);
   x<= x+1 after 10 ns;	
end architecture;


