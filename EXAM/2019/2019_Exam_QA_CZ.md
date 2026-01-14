````markdown
# LSP Zkouška 2019 - Otázky a odpovědi [Obsahuje oficiální odpovědi]

> **CVUT FEL (ČVUT) - České vysoké učení technické v Praze | Czech Technical University in Prague**
>
> 🇨🇳 [中文版](2019_Exam_QA_CN.md) | 🇬🇧 [English](2019_Exam_QA_EN.md) | 🇨🇿 [Čeština](2019_Exam_QA_CZ.md)

> ✅ **Tento soubor obsahuje oficiální odpovědi (Obsahuje oficiální odpovědi)**

---

## Úloha 2: Simulace RS klopného obvodu ⭐Často testováno

**Úloha**: Pro dané vstupy A, B, C v časech t0, t1, t2, t3 jak je ukázáno, napište hodnotu výstupu Q.

```
A = ..0..|..1..|..1..|..1..|
B = ..0..|..0..|..0..|..1..|
C = ..1..|..1..|..0..|..0..|

t0   t1   t2   t3
```

### ✅ Odpověď
```
Q = ...1...|…0….|…0….|…1.…|
```

---

## Úloha 3: Shannonův rozklad ⭐Často testováno

**Úloha**: Rozložte funkci `Q=f(A,B,C,Q)` na:
```
Q = (not Q and f0(A,B,C)) or (Q and f1(A,B,C))
```

### ✅ Postup řešení

**Krok 1**: Nechť Q=0, najděte f0
```
f0 := f(A,B,C,'0') 
   := (A ≡ B) · ('0' + (B ≠ C)) 
   := (A ≡ B) · (B ≠ C)
```

**Krok 2**: Nechť Q=1, najděte f1
```
f1 := f(A,B,C,'1') 
   := (A ≡ B) · ('1' + (B ≠ C)) 
   := (A ≡ B) · '1' 
   := (A ≡ B)
```

### ✅ Karnaughova mapa pro f0: (A ≡ B) · (B ≠ C)

```
      C=0  C=1
AB=00  0    1
AB=01  0    0
AB=11  1    0
AB=10  0    0
```

Zakroužkujte: (A̅B̅C) + (ABC̅) = (A ≡ B)(B ≠ C)

### ✅ Karnaughova mapa pro f1: (A ≡ B)

```
      C=0  C=1
AB=00  1    1
AB=01  0    0
AB=11  1    1
AB=10  0    0
```

Zakroužkujte: (A̅B̅) + (AB) = (A ≡ B) = A XNOR B

---

## Úloha 5: Ekvivalentní logické funkce ⭐Často testováno

**Úloha**: Označte všechny logické funkce, které jsou ekvivalentní s jinými funkcemi:

```vhdl
f1 <= (A xor C) or (A and not C);
f2 <= (B or C) and (not A or B or C);
f3 <= ((C and not B) or (B and A));
f4 <= (A or C) and (not A or not C);
f5 <= (A and not B) xor (A and C);
f6 <= (A and not C) or (C and not A);
```

### ✅ Odpověď

Analýza každé funkce pomocí Karnaughových map:

**Karnaughova mapa pro f4:**
```
(A or C) and (not A or not C)
= (A + C) · (A̅ + C̅)
= A·A̅ + A·C̅ + C·A̅ + C·C̅
= A·C̅ + A̅·C
= A ⊕ C
```

**Karnaughova mapa pro f6:**
```
(A and not C) or (C and not A)
= A·C̅ + C·A̅
= A ⊕ C
```

### 🎯 Závěr: **f4 ≡ f6** (obě jsou A XOR C)

---

## Rychlý přehled pravdivostních tabulek

### Pravdivostní tabulka A ⊕ C (XOR)

| A | C | A⊕C |
|---|---|-----|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

### Pravdivostní tabulka A ≡ B (XNOR)

| A | B | A≡B |
|---|---|-----|
| 0 | 0 | 1 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

---

## Souhrn znalostí

### Kroky řešení Shannonova rozkladu

1. **Identifikujte zpětnovazební proměnnou**: Najděte proměnnou, která je vstupem i výstupem (např. Q)
2. **Dosaďte Q=0**: Získejte f0(ostatní proměnné)
3. **Dosaďte Q=1**: Získejte f1(ostatní proměnné)
4. **Nakreslete Karnaughovy mapy**: Nakreslete mapy pro f0 a f1 zvlášť
5. **Ověřte**: Q = Q̅·f0 + Q·f1

### Tipy pro identifikaci ekvivalentních funkcí

1. Nejprve zjednodušte každý výraz
2. Porovnejte pomocí Karnaughových map
3. Všimněte si ekvivalentních forem XOR a XNOR:
   - A ⊕ C = A·C̅ + A̅·C
   - A ≡ C = A·C + A̅·C̅ = (A ⊕ C)̅

````