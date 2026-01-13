# 2024-12-20 LSP Exam Solution / Řešení zkoušky / 考试解析

> **Course**: B0B35LSP - Logické systémy a procesory | BE5B35LSP - Logic Systems and Processors
> **University**: ČVUT FEL (CTU) - České vysoké učení technické v Praze
> **Keywords**: Zkouška, Exam, Test, Solutions, Vysledky, Answers, K-Map, RS Latch, Pipeline
>
> [🇨🇳 CN Version](./2024-12-20_Exam_Answers_CN.md) | [🇬🇧 EN Version](./2024-12-20_Exam_Answers_EN.md) | [🇨🇿 CZ Version](./2024-12-20_Exam_Answers_CZ.md)

---

## Informace o zkoušce
- Datum: 2024-12-20
- Jazyk: EN na zadání; oficiální odpovědi ověřeny z PDF

---

## Úloha 1 — Simulace RS klopného obvodu (5)
Vstupy:

```
A = 1 | 0 | 1 | 0 | 0
B = 0 | 1 | 0 | 0 | 0
C = 0 | 1 | 0 | 0 | 1
    t0  t1  t2  t3  t4
```

**Oficiální odpověď (podle CN zdroje):**
- X = 00011 (t0=0, t1=0, t2=0, t3=1, t4=1) *(na listu je uvedena i alternativní možnost dle polarity zapojení)*
- Y = 10110 (t0=1, t1=0, t2=1, t3=1, t4=0) *(odpovídající alternativa existuje)*

Poznámka: A=1 se chová jako **Reset**, zatímco B·C=1 jako **Set**.

---

## Úloha 2 — Shannonův rozklad (6)
Rozložte $X=f(A,B,C,X)$:

$$X=(\lnot X\land f_0(A,B,C))\;\lor\;(X\land f_1(A,B,C)).$$

Postup: odvoďte $f$ ze schématu, spočtěte $f_0=f(\cdot,0)$ a $f_1=f(\cdot,1)$ a minimalizujte pomocí Karnaughových map.

---

## Úloha 3 — Ekvivalentní logické funkce (4)

```vhdl
x1 <= (B and not A) or (A and not B);
x2 <= (A and not C) xor (C and A);
x3 <= (B or A) and (not B or not A);
x4 <= (C xor A) or (B and not A);
```

**Oficiální odpověď:** $x1 \equiv x3$ (obě jsou $A\oplus B$).

---

## Úloha 4 — Aritmetika v 9 bitech (4)
254 + 255 + 256 + 257 = 1022.

- Unsigned (9-bit): $1022 \bmod 512 = 510$
- Se znaménkem (two’s complement, 9-bit): $510-512=-2$

**Oficiální odpověď:** unsigned 510, signed -2.

---

## Úloha 5 — Definice Moore/Mealy automatu (6)
Pro $M=\langle X,S,Z,\omega,\delta,s_0\rangle$:
- $X$: konečná vstupní abeceda
- $S$: konečná množina stavů
- $Z$: konečná výstupní abeceda
- $\delta$: přechodová funkce
- $\omega$: výstupní funkce
- $s_0$: počáteční stav

Moore vs Mealy:
- Moore: $\omega: S \to Z$
- Mealy: $\omega: S\times X \to Z$

---

## Úloha 6 — Implementace multiplexoru hradly (5)
Použijte standardní rovnici 2:1 MUX:

$$Y = (\lnot S\land A) \lor (S\land B).$$

A poté přepište na povolená hradla (AND/NAND/OR/NOR/NOT) pomocí De Morganových pravidel.

---

## Úloha 7 — Multiplexor ve VHDL (10)
**Oficiální concurrent tvar:**

```vhdl
Qcon <= z when a1='1' else y when a0='1' else x;
```

---

## Úloha 8 — Direct-mapped cache (10)
Podle rozsahu pro 2026-01 lze cache úlohy přeskočit; ponecháno pro referenci.

Hit/miss stopa (dle CN):
- miss: 0x10, 0x28, 0x94, 0xA8
- hit: 0x14, 0x2C, 0x10, 0xAC

Dělení adresy: `[tag][5-bit set][3-bit offset]`.
