library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all;
library work;
entity testbench_EA is end entity;

architecture rtl of testbench_EA is
signal x:unsigned(3 downto 0):=(others=>'0');
signal y, stop : std_logic:='0';

begin -- architecture, we implement all only by Concurrent Statements
   iea : entity work.MorseEA port map (x,y, stop);
   x<= x+1 after 10 ns;	
end architecture;


