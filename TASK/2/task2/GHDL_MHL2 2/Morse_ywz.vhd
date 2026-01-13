library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all;
entity MorseYWZ is
port ( X : in unsigned(5 downto 0):=(others=> '0'); -- I/O initializations are only relevant for simulations.
Y, STOP : out std_logic:='0' );
end entity;
architecture behavioral of MorseYWZ is
signal a, b, c, d, e, f : std_logic:='0';
signal Y00, Y01, Y10, Y11 : std_logic:='0';
begin
-- renaming of signals
a<= X(5); b<= X(4); c<= X(3); d<= X(2); e<= X(1); f<= X(0);
Y00 <= (c and not e) or (f and not c) or (f and not d) or (e and not c and not d);
Y01 <= (d and e ) or (d and f) or (e and f) or (f and not c);
Y10 <= (d and f) or (e and f) or (c and d and e) or (d and not c and not e);
Y11 <= (e and not c and not d) or (f and not c and not d);
-- Multiplexer -----------------------------
with X(5 downto 4) select
Y <= Y00 when "00", Y01 when "01", Y10 when "10",
Y11 when others; -- 2 std_logic bits can have 9*9 values!!!
STOP<= a and b and f; -- 2**5 + 2**4 + 1 = 49
end architecture;