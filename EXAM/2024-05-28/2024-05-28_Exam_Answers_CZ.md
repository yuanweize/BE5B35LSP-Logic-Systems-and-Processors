# LSP zkouška — 28. května 2024 (včetně oficiálních odpovědí)

> **CVUT FEL (ČVUT) - České vysoké učení technické v Praze | Czech Technical University in Prague**
>
> 🇨🇳 [中文版](2024-05-28_Exam_Answers_CN.md) | 🇬🇧 [English](2024-05-28_Exam_Answers_EN.md) | 🇨🇿 [Čeština](2024-05-28_Exam_Answers_CZ.md)

> ✅ **Ověřeno podle oficiálních odpovědí v PDF**

## Informace o zkoušce
- Datum: 28. května 2024
- Jazyk: čeština
- Obsahuje oficiální odpovědi

---

## Úloha 1 - Simulace RS latch (4 body)
**Zadání:** Pro dané hodnoty vstupů A, B, C v časech t0–t4 určete hodnoty výstupů X a Y.

**Vstupní sekvence:**
```
A = 0 | 0 | 0 | 1 | 0
B = 1 | 1 | 0 | 1 | 1
C = 0 | 1 | 0 | 0 | 0
    t0  t1  t2  t3  t4
```

> ✅ **Oficiální odpověď:**
> - **X = 11001** (t0=1, t1=1, t2=0, t3=0, t4=1)
> - **Y = 01100** (t0=0, t1=1, t2=1, t3=0, t4=0)

> 💡 **Doplňující poznámky:** V čase t1 je B·C=1 a může dojít k nastavení (Set) a tedy Y=0. Ověřte podle konkrétního zapojení v testu.

---

## Úloha 2 - Shannonův rozklad (6 bodů)
**Zadání:** Rozložte X=f(A,B,C,X) do tvaru Shannonova rozkladu.

> 💡 **Doplňující poznámky:** Shannonova věta: f(X) = X̄·f(0) + X·f(1)

---

## Úloha 3 - Ekvivalentní logické funkce (4 body)
**Zadání:** Zaškrtněte všechny logické funkce, které jsou ekvivalentní.

```vhdl
y1 <= (D or A) and (not D or C or A);
y2 <= (not D and A) or (D and not A) or (C and A);
y3 <= C or (D and C and B) or (not D and C and A);
y4 <= (C and A) or (not D xor not A);
```

**Oficiální odpověď:** y2 = y4

> 💡 **Doplňující poznámky:**
> - y2 = D̄A + DĀ + CA = (A ⊕ D) + CA
> - y4 = CA + (D̄ ⊕ Ā) = CA + (A ⊕ D) (protože D̄⊕Ā = A⊕D)

---

## Úloha 4 - Aritmetika 9bitového sčítače (2 body)
**Zadání:** Výsledek 254+255+256+257 na 9bitovém sčítači.

**Výpočet:**
- 254+255+256+257 = 1022
- 1022 mod 512 = 510

**Oficiální odpověď:**
- a) unsigned: 510
- b) signed: -2 (dvojkový doplněk: 510 - 512)

> 💡 **Doplňující poznámky:** Rozsah 9 bitů: unsigned 0–511, signed -256–255

---

## Úloha 5 - Definice Moore/Mealy automatu (4 body)
**Zadání:** Doplňte definici.

> 💡 **Doplňující poznámky:**
> - Moore: M = <X, S, Z, δ, ω, s₀>, kde ω: S → Z
> - Mealy: M = <X, S, Z, δ, ω, s₀>, kde ω: S×X → Z

---

## Úloha 6 - Realizace multiplexeru (6 bodů)
**Zadání:** Realizujte kaskádovaný multiplexer pomocí hradel AND, NAND, OR, NOR a NOT.

> 💡 **Doplňující poznámky:** 2:1 MUX = (S̄·A) + (S·B); typicky 2×AND + 1×OR + 1×NOT.

---

## Úloha 7 - Popis MUX ve VHDL (8 bodů)
**Zadání:** Popište pomocí souběžných a sekvenčních příkazů.

> 💡 **Doplňující poznámky:**
> - Souběžně (Concurrent): `y <= a when sel='1' else b;`
> - Sekvenčně (Sequential): `if sel='1' then y <= a; else y <= b; end if;`

---

## Úloha 8 - Prediktor větvení (6 bodů)
**Zadání:** C program hledá minimum; spočítejte počet chybných predikcí větvení.

**Oficiální odpověď:** U obou prediktorů je 7 miss.

> 💡 **Doplňující poznámky:** Větvení `if` závisí na rozložení dat. Pro náhodná data se minimum v průměru aktualizuje přibližně log₂(n) krát.

---

## Úloha 9 - Návrh demultiplexeru (10 bodů)
**Zadání:** Nakreslete symbol a vnitřní zapojení popsané kódem.

**Oficiální odpověď:** Kód popisuje demultiplexer (DEMUX).

> 💡 **Doplňující poznámky:**
> - MUX: více vstupů → jeden výstup (selektor)
> - DEMUX: jeden vstup → více výstupů (rozbočovač)
> - Vzorec DEMUX: Yᵢ = D · (sel = i)
