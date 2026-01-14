# LSP Exam — May 28, 2024 (Official Answers Included)

> **CVUT FEL (ČVUT) - České vysoké učení technické v Praze | Czech Technical University in Prague**
>
> 🇨🇳 [中文版](2024-05-28_Exam_Answers_CN.md) | 🇬🇧 [English](2024-05-28_Exam_Answers_EN.md) | 🇨🇿 [Čeština](2024-05-28_Exam_Answers_CZ.md)

> ✅ **Verified against official PDF answers**

## Exam Information
- Date: May 28, 2024
- Language: Czech
- Official answers included

---

## Q1 - RS Latch Simulation (4 points)
**Problem:** Given the values of inputs A, B, C at times t0–t4, write the values of outputs X and Y.

**Input sequence:**
```
A = 0 | 0 | 0 | 1 | 0
B = 1 | 1 | 0 | 1 | 1
C = 0 | 1 | 0 | 0 | 0
    t0  t1  t2  t3  t4
```

> ✅ **Official answer:**
> - **X = 11001** (t0=1, t1=1, t2=0, t3=0, t4=1)
> - **Y = 01100** (t0=0, t1=1, t2=1, t3=0, t4=0)

> 💡 **Additional notes:** At t1, B·C=1 may trigger Set and make Y=0. Confirm based on the exact latch variant in the exam.

---

## Q2 - Shannon Expansion (6 points)
**Problem:** Decompose X=f(A,B,C,X) into Shannon expansion form.

> 💡 **Additional notes:** Shannon’s theorem: f(X) = X̄·f(0) + X·f(1)

---

## Q3 - Equivalent Logic Functions (4 points)
**Problem:** Check all logic functions that are equivalent.

```vhdl
y1 <= (D or A) and (not D or C or A);
y2 <= (not D and A) or (D and not A) or (C and A);
y3 <= C or (D and C and B) or (not D and C and A);
y4 <= (C and A) or (not D xor not A);
```

**Official answer:** y2 = y4

> 💡 **Additional notes:**
> - y2 = D̄A + DĀ + CA = (A ⊕ D) + CA
> - y4 = CA + (D̄ ⊕ Ā) = CA + (A ⊕ D) (because D̄⊕Ā = A⊕D)

---

## Q4 - 9-bit Adder Arithmetic (2 points)
**Problem:** Result of 254+255+256+257 on a 9-bit adder.

**Calculation:**
- 254+255+256+257 = 1022
- 1022 mod 512 = 510

**Official answer:**
- a) unsigned: 510
- b) signed: -2 (two’s complement: 510 - 512)

> 💡 **Additional notes:** 9-bit range: unsigned 0–511, signed -256–255

---

## Q5 - Moore/Mealy FSM Definition (4 points)
**Problem:** Complete the definition.

> 💡 **Additional notes:**
> - Moore: M = <X, S, Z, δ, ω, s₀>, where ω: S → Z
> - Mealy: M = <X, S, Z, δ, ω, s₀>, where ω: S×X → Z

---

## Q6 - Multiplexer Implementation (6 points)
**Problem:** Implement a cascaded multiplexer using AND, NAND, OR, NOR and NOT gates.

> 💡 **Additional notes:** 2-to-1 MUX = (S̄·A) + (S·B); typically needs 2 AND + 1 OR + 1 NOT.

---

## Q7 - MUX in VHDL (8 points)
**Problem:** Describe using concurrent and sequential statements.

> 💡 **Additional notes:**
> - Concurrent: `y <= a when sel='1' else b;`
> - Sequential: `if sel='1' then y <= a; else y <= b; end if;`

---

## Q8 - Branch Predictor (6 points)
**Problem:** A C program finds the minimum; compute the number of branch mispredictions.

**Official answer:** Both predictors have 7 misses.

> 💡 **Additional notes:** The `if` branch depends on the data distribution. For random data, the minimum is updated on average about log₂(n) times.

---

## Q9 - Demultiplexer Design (10 points)
**Problem:** Draw the symbol and internal circuit described by the code.

**Official answer:** The code describes a demultiplexer (DEMUX).

> 💡 **Additional notes:**
> - MUX: multiple inputs → single output (selector)
> - DEMUX: single input → multiple outputs (distributor)
> - DEMUX formula: Yᵢ = D · (sel = i)
