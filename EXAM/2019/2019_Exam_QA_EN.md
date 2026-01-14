````markdown
# LSP Exam 2019 - Questions and Answers [Official Answers Included]

> **CVUT FEL (ČVUT) - České vysoké učení technické v Praze | Czech Technical University in Prague**
>
> 🇨🇳 [中文版](2019_Exam_QA_CN.md) | 🇬🇧 [English](2019_Exam_QA_EN.md) | 🇨🇿 [Čeština](2019_Exam_QA_CZ.md)

> ✅ **This file contains official answers (Official Answers Included)**

---

## Question 2: RS Latch Circuit Simulation ⭐Frequently Tested

**Question**: Given inputs A, B, C values at times t0, t1, t2, t3 as shown, write the Q output value.

```
A = ..0..|..1..|..1..|..1..|
B = ..0..|..0..|..0..|..1..|
C = ..1..|..1..|..0..|..0..|

t0   t1   t2   t3
```

### ✅ Answer
```
Q = ...1...|…0….|…0….|…1.…|
```

---

## Question 3: Shannon Expansion ⭐Frequently Tested

**Question**: Decompose the function `Q=f(A,B,C,Q)` into:
```
Q = (not Q and f0(A,B,C)) or (Q and f1(A,B,C))
```

### ✅ Solution Method

**Step 1**: Let Q=0, find f0
```
f0 := f(A,B,C,'0') 
   := (A ≡ B) · ('0' + (B ≠ C)) 
   := (A ≡ B) · (B ≠ C)
```

**Step 2**: Let Q=1, find f1
```
f1 := f(A,B,C,'1') 
   := (A ≡ B) · ('1' + (B ≠ C)) 
   := (A ≡ B) · '1' 
   := (A ≡ B)
```

### ✅ Karnaugh Map for f0: (A ≡ B) · (B ≠ C)

```
      C=0  C=1
AB=00  0    1
AB=01  0    0
AB=11  1    0
AB=10  0    0
```

Circle: (A̅B̅C) + (ABC̅) = (A ≡ B)(B ≠ C)

### ✅ Karnaugh Map for f1: (A ≡ B)

```
      C=0  C=1
AB=00  1    1
AB=01  0    0
AB=11  1    1
AB=10  0    0
```

Circle: (A̅B̅) + (AB) = (A ≡ B) = A XNOR B

---

## Question 5: Equivalent Logic Functions ⭐Frequently Tested

**Question**: Mark all logic functions that are equivalent to other functions:

```vhdl
f1 <= (A xor C) or (A and not C);
f2 <= (B or C) and (not A or B or C);
f3 <= ((C and not B) or (B and A));
f4 <= (A or C) and (not A or not C);
f5 <= (A and not B) xor (A and C);
f6 <= (A and not C) or (C and not A);
```

### ✅ Answer

Analyze each function using Karnaugh maps:

**Karnaugh Map for f4:**
```
(A or C) and (not A or not C)
= (A + C) · (A̅ + C̅)
= A·A̅ + A·C̅ + C·A̅ + C·C̅
= A·C̅ + A̅·C
= A ⊕ C
```

**Karnaugh Map for f6:**
```
(A and not C) or (C and not A)
= A·C̅ + C·A̅
= A ⊕ C
```

### 🎯 Conclusion: **f4 ≡ f6** (both are A XOR C)

---

## Truth Table Quick Reference

### A ⊕ C (XOR) Truth Table

| A | C | A⊕C |
|---|---|-----|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

### A ≡ B (XNOR) Truth Table

| A | B | A≡B |
|---|---|-----|
| 0 | 0 | 1 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

---

## Knowledge Summary

### Shannon Expansion Solution Steps

1. **Identify feedback variable**: Find the variable that is both input and output (e.g., Q)
2. **Substitute Q=0**: Get f0(other variables)
3. **Substitute Q=1**: Get f1(other variables)
4. **Draw Karnaugh maps**: Draw maps for f0 and f1 separately
5. **Verify**: Q = Q̅·f0 + Q·f1

### Equivalent Function Identification Tips

1. First simplify each expression
2. Compare using Karnaugh maps
3. Note XOR and XNOR equivalent forms:
   - A ⊕ C = A·C̅ + A̅·C
   - A ≡ C = A·C + A̅·C̅ = (A ⊕ C)̅

````