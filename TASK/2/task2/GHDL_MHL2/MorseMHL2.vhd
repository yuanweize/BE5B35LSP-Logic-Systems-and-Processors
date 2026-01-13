library ieee; use ieee.std_logic_1164.all;use ieee.numeric_std.all;
entity MorseMHL2 is
port ( X : in unsigned(5 downto 0):=(others=>'0');
       Y, STOP : out std_logic:='0');
-- I/O initializations are only relevant for simulations.
end entity;

architecture behavioral of MorseMHL2 is
signal a, b, c, d, e, f : std_logic:='0';
signal Y00, Y01, Y10, Y11 : std_logic:='0';
begin
-- renaming of signals
a<=X(5); b<=X(4); c <= X(3); d <= X(2); e <= X(1); f <= X(0);
Y00 <= (e and f) or (not c and e) or (not c and f) or (d and f);
Y01 <= (not e and f) or (c and not d and f) or (not c and d and f) or (c and not d and not e);
Y10 <= (c and e) or (d and e) or f;
Y11 <= '0';
-- Multiplexer -----------------------------
 with X(5 downto 4) select
 Y <= Y00 when "00", Y01 when "01", Y10 when "10", 
		  Y11 when others; -- 2 std_logic bits can have 9*9 values!!!
 STOP <= a and b and f; -- 2**5 + 2**4 + 1 = 49
end architecture;
