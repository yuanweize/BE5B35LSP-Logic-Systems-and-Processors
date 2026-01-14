# LSP Závěrečná zkouška - 7. ledna 2015

> **CVUT FEL (ČVUT) - České vysoké učení technické v Praze | Czech Technical University in Prague**
>
> 🇨🇳 [中文版](2015-01-07_Final_Exam_CN.md) | 🇬🇧 [English](2015-01-07_Final_Exam_EN.md) | 🇨🇿 [Čeština](2015-01-07_Final_Exam_CZ.md)

> 🧠 **AI-generované řešení** - Referenční analýza níže

---

## Úloha 1: Pravdivostní tabulka obvodu a Karnaughova mapa

**Zadání**: Vytvořte pravdivostní tabulku na základě daného schématu obvodu. Zapište výstupy Y, Z do Karnaughovy mapy v pořadí YZ.

```
Vstupy: A, B, C, D, E
Výstupy: Y, Z
```

| YZ | AB |
|----|-----|
|    | 00 01 10 11 |

---

## Úloha 2: Shannonův rozklad

**Zadání**: Rozložte funkci `Q:=f(A,B,C,D)` do následující formy:

```
Q = f(A,B,C,D) := (A or B) and (((A and not B) xor (D and not A)) or (C and not D))
```

Rozložte na:
```
Q = C̄·D̄·f0(A,B) + C̄·D·f1(A,B) + C·D̄·f2(A,B) + C·D·f3(A,B)
```

Napište Karnaughovy mapy pro f0, f1, f2, f3.

### Odpověď

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

## Úloha 3: Ekvivalentní logické funkce ⭐Často testováno

**Zadání**: Označte všechny logické funkce, které jsou ekvivalentní s jinými funkcemi:

```vhdl
f1 <= (A xor C) or (A and not C);
f2 <= (B or C) and (not A or B or C);
f3 <= ((C and not B) or (B and A));
f4 <= (A or C) and (not A or not C);
f5 <= (A and not B) xor (A and C);
f6 <= (A and not C) or (C and not A);
```

### Postup řešení
Nakreslete Karnaughovu mapu pro každou funkci a najděte, které jsou identické!

---

## Úloha 4: Simulace RS klopného obvodu ⭐Často testováno

**Zadání**: Pro vstupy A, B, C v časech t0, t1, t2, t3 podle zobrazených hodnot napište hodnoty výstupů X a Y.

```
A = ..0..|..1..|..1..|..1..|
B = ..0..|..0..|..0..|..1..|
C = ..1..|..1..|..0..|..0..|

t0   t1   t2   t3

X = _____|_____|_____|_____|
```

Předpokládejte, že intervaly mezi změnami vstupů jsou dostatečně dlouhé na zanedbání zpoždění hradel.

---

## Úloha 5: Shannonův rozklad ⭐Často testováno

**Zadání**: Rozložte funkci `X=f(A,B,C,X)` z úlohy 4 do tvaru:

```
X = (not X and f0(A,B,C)) or (X and f1(A,B,C))
```

Napište Karnaughovy mapy pro f0 a f1.

---

## Úloha 6: VHDL posuvný registr

**Zadání**: Doplňte VHDL program pro vytvoření 100-bitového posuvného registru.

- Výstup q je vstup d zpožděný o 100 hodinových pulsů
- Registr je vymazán synchronním signálem `sclrn='0'`
- Použijte nejkratší kód (nápověda: nejkratší kód neobsahuje smyčky)

```vhdl
library IEEE; use IEEE.STD_LOGIC_1164.all;
entity pos100 is port (clock, d, sclrn : in std_logic; q: out std_logic) end pos100;

-- Doplňte kód zde
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

## Shrnutí klíčových témat

1. **Pravdivostní tabulka a Karnaughova mapa** - Analýza obvodu
2. **Shannonův rozklad** - Technika dekompozice funkcí
3. **Ekvivalentní logické funkce** - Ověření pomocí Karnaughových map
4. **Simulace RS klopného obvodu** - Časová analýza
5. **VHDL programování** - Návrh posuvného registru
