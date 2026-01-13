library ieee;use ieee.std_logic_1164.all;use ieee.numeric_std.all;
entity MorseEA is
	port (X	: in unsigned(3 downto 0):=(others=>'0'); --CDEF
	      Y, STOP : out std_logic:='0');
end entity;

architecture behavioral of MorseEA is
signal c,d,e,f : std_logic:='0';
begin
  f<=X(0); e<=X(1); d<=X(2); c<=X(3);
	Y <= (f or c) and (not e or d);
	STOP <= c and e and f;
end architecture;
