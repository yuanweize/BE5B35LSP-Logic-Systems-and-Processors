# LSP Final Exam - January 7, 2015

> **CVUT FEL (ČVUT) - České vysoké učení technické v Praze | Czech Technical University in Prague**
>
> 🇨🇳 [中文版](2015-01-07_Final_Exam_CN.md) | 🇬🇧 [English](2015-01-07_Final_Exam_EN.md) | 🇨🇿 [Čeština](2015-01-07_Final_Exam_CZ.md)

> 🧠 **AI-Generated Solution** - Reference analysis below

---

## Question 1: Circuit Truth Table and Karnaugh Map

**Question**: Create a truth table based on the given circuit diagram. Write outputs Y, Z into the Karnaugh map in YZ order.

```
Inputs: A, B, C, D, E
Outputs: Y, Z
```

| YZ | AB |
|----|-----|
|    | 00 01 10 11 |

---

## Question 2: Shannon Expansion Decomposition

**Question**: Decompose the function `Q:=f(A,B,C,D)` into the following form:

```
Q = f(A,B,C,D) := (A or B) and (((A and not B) xor (D and not A)) or (C and not D))
```

Decompose into:
```
Q = C̄·D̄·f0(A,B) + C̄·D·f1(A,B) + C·D̄·f2(A,B) + C·D·f3(A,B)
```

Write the Karnaugh maps for f0, f1, f2, f3.

### Answer

| f0 | A=0 | A=1 |
|----|-----|-----|
| B=0 | 0 | 1 |
| B=1 | 0 | 0 |

| f1 | A=0 | A=1 |
|----|-----|-----|
| B=0 | 1 | 1 |
| B=1 | 1 | 0 |

| f2 | A=0 | A=1 |
|----|-----|-----|
| B=0 | 0 | 1 |
| B=1 | 0 | 1 |

| f3 | A=0 | A=1 |
|----|-----|-----|
| B=0 | 0 | 1 |
| B=1 | 0 | 0 |

---

## Question 3: Equivalent Logic Functions ⭐Frequently Tested

**Question**: Mark all logic functions that are equivalent to other functions:

```vhdl
f1 <= (A xor C) or (A and not C);
f2 <= (B or C) and (not A or B or C);
f3 <= ((C and not B) or (B and A));
f4 <= (A or C) and (not A or not C);
f5 <= (A and not B) xor (A and C);
f6 <= (A and not C) or (C and not A);
```

### Solution Method
Draw a Karnaugh map for each function and find which ones are identical!

---

## Question 4: RS Latch Circuit Simulation ⭐Frequently Tested

**Question**: Given inputs A, B, C values at times t0, t1, t2, t3 as shown, write the X and Y output values.

```
A = ..0..|..1..|..1..|..1..|
B = ..0..|..0..|..0..|..1..|
C = ..1..|..1..|..0..|..0..|

t0   t1   t2   t3

X = _____|_____|_____|_____|
```

Assume the intervals between input changes are long enough to ignore gate delays.

---

## Question 5: Shannon Expansion ⭐Frequently Tested

**Question**: Decompose the function `X=f(A,B,C,X)` from question 4 into:

```
X = (not X and f0(A,B,C)) or (X and f1(A,B,C))
```

Write the Karnaugh maps for f0 and f1.

---

## Question 6: VHDL Shift Register

**Question**: Complete the VHDL program to create a 100-bit shift register.

- Output q is input d delayed by 100 clock pulses
- Register is cleared by synchronous signal `sclrn='0'`
- Use the shortest code (hint: shortest code does not include loops)

```vhdl
library IEEE; use IEEE.STD_LOGIC_1164.all;
entity pos100 is port (clock, d, sclrn : in std_logic; q: out std_logic) end pos100;

-- Complete the code here
architecture rtl of pos100 is
    signal reg : std_logic_vector(99 downto 0);
begin
    process(clock)
    begin
        if rising_edge(clock) then
            if sclrn = '0' then
                reg <= (others => '0');
            else
                reg <= d & reg(99 downto 1);
            end if;
        end if;
    end process;
    q <= reg(0);
end rtl;
```

---

## Key Topics Summary

1. **Truth Table and Karnaugh Map** - Circuit analysis
2. **Shannon Expansion** - Function decomposition technique
3. **Equivalent Logic Functions** - Verify using Karnaugh maps
4. **RS Latch Simulation** - Timing analysis
5. **VHDL Programming** - Shift register design
