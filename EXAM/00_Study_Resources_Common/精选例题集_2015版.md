# LSP精选例题集 2015版 (捷克语)

## 版本信息
- 版本：2015-V1.1
- 构建日期：2016年1月6日
- 语言：捷克语
- 内容：往年考试精选例题，附详细解答

---

## 说明
- 例题来自往年考试，用于展示考试内容
- 不是完整列表，考试可能出现其他题目
- 不包含理论问答题
- 没有解答的题目可以通过仿真或讲座验证

---

## B系列例题

### B1. De Morgan展开 (XOR转AND/OR/NOT)

**题目：** 将VHDL函数展开，使其只包含"or"、"and"和"not"操作，且"not"不能作用于括号内的表达式。
**[English]** Expand the VHDL function so it only contains "or", "and" and "not" operations, where "not" cannot apply to expressions in parentheses.

```vhdl
F1 <= A xor (B or C);
```
**✅ 答案：**
```vhdl
F1 <= (A and not B and not C) or (not A and (B or C));
```

```vhdl
F2 <= not (A and (B xor C));
```
**✅ 答案：**
```vhdl
F2 <= not A or ((not B or C) and (B or not C));
```

---

### B3. RS锁存器仿真

**输入序列：**
```
A = 0|1|1|1
B = 0|0|0|1
C = 1|1|0|0
    t0|t1|t2|t3
```

**✅ 答案：**
```
Q = 1|0|0|1
```

---

### B4. Shannon展开

**题目：** 将B3的函数Q=f(A,B,C,Q)分解为 Q = Q̄·f₀(A,B,C) + Q·f₁(A,B,C)
**[English]** Decompose the function Q=f(A,B,C,Q) from B3 into Q = Q̄·f₀(A,B,C) + Q·f₁(A,B,C)

**解法步骤：**
1. 从电路图写出表达式：Q := (A xor B) + (Q + (B xor C))
2. 用De Morgan展开：Q := (A ≡ B) · (Q + (B ≠ C))
3. 计算cofactors：
   - f₀ = f(A,B,C,'0') = (A ≡ B) · (B ≠ C)
   - f₁ = f(A,B,C,'1') = (A ≡ B)

**✅ 答案（卡诺图）：**
```
f0:     A               f1:     A
       B 0  1                  B 0  1
    ┌─────┬─────          ┌─────┬─────
C 0 │  0  │  0  │  1  │  0   │  1  │  0  │  1  │  0
  1 │  1  │  0  │  0  │  0   │  1  │  0  │  1  │  0
```

---

### B5. 卡诺图覆盖 (SoP和PoS)

**题目：** 标记最小覆盖，选择不产生hazard的覆盖
**[English]** Mark the minimum cover, choose covers that do not produce hazards

**要点：**
- SoP覆盖1
- PoS覆盖0
- 需要连续覆盖以避免hazard

---

## A系列例题

### A1. 逻辑函数取反

**题目：** 写出函数的非否定形式
**[English]** Write the function in non-negated form

```
F1 = A·B·C + A·B̄·C + A·B̄ + A·C + B·C
```
**✅ 答案：**
```
F1 = (A+B+C)·(A+B̄+C)·(A+B̄)·(A+C)·(B+C)
```

```
F2 = (A+B+C)·(A+B̄+C)·(A+B̄)·(A+C)·(B+C)
```
**✅ 答案：**
```
F2 = A·B·C + A·B̄·C + A·B̄ + A·C + B·C
```

---

### A3. 组合电路输出计算

**输入：** A=0, B=1, C=0, D=0

**✅ 答案：**
- X = **1**
- Y = **0**
- Z = **1**

---

### A4. Shannon展开 (4变量)

**题目：** Y=f(A,B,C,D) 分解为 Y = C̄·f₀(A,B,D) + C·f₁(A,B,D)
**[English]** Decompose Y=f(A,B,C,D) into Y = C̄·f₀(A,B,D) + C·f₁(A,B,D)

**✅ 答案（卡诺图）：**
```
f0:     A               f1:     A
       B 0  1                  B 0  1
    ┌─────┬─────          ┌─────┬─────
D 0 │  1  │  0  │  0  │  1   │  0  │  1  │  1  │  0
  1 │  1  │  0  │  0  │  1   │  1  │  1  │  1  │  1
```

---

## C系列例题

### C1. 基本门真值表

| 门类型 | 符号 | 真值表 |
|--------|------|--------|
| NAND | ⊼ | 00→1, 01→1, 10→1, 11→0 |
| NOR | ⊽ | 00→1, 01→0, 10→0, 11→0 |
| AND | ∧ | 00→0, 01→0, 10→0, 11→1 |
| XOR | ⊕ | 00→0, 01→1, 10→1, 11→0 |

---

## D系列例题

### D3. 四变量Shannon展开

**题目：** Q = (A or B) and (((A and not B) xor (D and not A)) or (C and not D))
分解为 Q = C̄D̄·f₀ + C̄D·f₁ + CD̄·f₂ + CD·f₃
**[English]** Decompose Q = (A or B) and (((A and not B) xor (D and not A)) or (C and not D)) into Q = C̄D̄·f₀ + C̄D·f₁ + CD̄·f₂ + CD·f₃

**✅ 答案（卡诺图）：**
```
f0:    A           f1:    A           f2:    A           f3:    A
      B 0  1            B 0  1            B 0  1            B 0  1
      0  1               0  1               0  1               0  1
      0  0               1  0               1  1               1  0
```

---

### D4. 等价逻辑函数

```vhdl
f1 <= (A xor C) or (A and not C);
f2 <= (B or C) and (not A or B or C);
f3 <= ((C and not B) or (B and A));
f4 <= (A or C) and (not A or not C);
f5 <= (A and not B) xor (A and C);
f6 <= (A and not C) or (C and not A);
```

**✅ 答案：** f4 ≡ f6（都是A XOR C）

---

## E系列例题

### E1. 6输入比较器电路

**题目：** 写出YZ的真值表
**[English]** Write the truth table for YZ

**功能分析：**
- 这是一个3位比较器
- Y: FDB > ECA (大于)
- Z: FDB = ECA (相等)

---

### E4. 等价逻辑函数

```vhdl
f1 <= ((C and not B) or (C and B and A));
f2 <= (A xor C) or (A and not C);
f3 <= (A or B) and (not A or B or C);
f4 <= (not A or not C) and (C or A);
f5 <= (not C and A) or (not A and C);
f6 <= (A and not B) xor (A and not B and C);
```

**✅ 答案：** f4 ≡ f5（都是A XOR C）

---

### E4x. XOR等价判断

**题目：** 判断以下函数是否相同
**[English]** Determine if the following functions are equivalent
```vhdl
x1 <= (A and not C) or (C and not A);
x2 <= (A and not B) xor (A and C);
x3 <= (A or C) and (not A or not C);
x4 <= (A xor C) or (A and not C);
```

**✅ 答案：**
- x1 ≡ x3（标准XOR的SoP和PoS形式）
- x4 = A or C（x4不等于x1）
- x2需要用卡诺图分析

**解法关键：**
- x1和x3可以直接画卡诺图（分别是SoP和PoS形式）
- 结果都是A XOR C的标准形式

---

## C4. 四变量等价函数

```vhdl
f1 <= (((not B and not A) or (A and D)) and C) or (B and A);
f2 <= ((((not A or D) and C) or A) and B);
f3 <= ((C and (not A or D)) or B) and A and not B;
f4 <= ((not A or D) and C and not B) or (B and A);
f5 <= (A and not B) or (A and D) or (B and A);
f6 <= (B or C) and (not A or B or D) and (A or not B);
```

**✅ 答案：** f1 ≡ f4

---

## ⭐ 考试要点总结

### 1. De Morgan定律
```
NOT(A AND B) = (NOT A) OR (NOT B)
NOT(A OR B) = (NOT A) AND (NOT B)
A XOR B = (A AND NOT B) OR (NOT A AND B)
```

### 2. XOR的两种标准形式
- **SoP (Sum of Products):** `(A and not B) or (not A and B)`
- **PoS (Product of Sums):** `(A or B) and (not A or not B)`

### 3. Shannon展开
- f(X) = X̄·f₀ + X·f₁
- f₀ = f(X=0)
- f₁ = f(X=1)

### 4. 卡诺图覆盖
- SoP: 覆盖所有1
- PoS: 覆盖所有0
- 避免hazard: 使用连续覆盖
