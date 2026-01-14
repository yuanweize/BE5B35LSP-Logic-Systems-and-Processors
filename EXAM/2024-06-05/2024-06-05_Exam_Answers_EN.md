# LSP Exam — June 5, 2024 (Official Answers Included)

> **CVUT FEL (ČVUT) - České vysoké učení technické v Praze | Czech Technical University in Prague**
>
> 🇨🇳 [中文版](2024-06-05_Exam_Answers_CN.md) | 🇬🇧 [English](2024-06-05_Exam_Answers_EN.md) | 🇨🇿 [Čeština](2024-06-05_Exam_Answers_CZ.md)

> ✅ **Verified against official PDF answers**

## Exam Information
- Date: 2024年6月5日
- Language: 捷克语
- Official answers included

---

## Q1 - RS锁存器仿真 (RS Latch Simulation) (4分)
**Problem:** 给定输入A, B, C在时间t0-t4的值，写出X和Y输出的值
**[English]** Given inputs A, B, C values at times t0-t4, write the values of X and Y outputs

**Input sequence:**
```
A = 0 | 0 | 1 | 0 | 0
B = 0 | 0 | 0 | 1 | 0
C = 1 | 0 | 0 | 1 | 1
    t0  t1  t2  t3  t4
```

> ✅ **Official answer (Official Answer):**
> - **X = 00110** (t0=0, t1=0, t2=1, t3=1, t4=0) 或读作 t0=1,t1=1,t2=0,t3=0,t4=1
> - **Y = 10011** (t0=1, t1=0, t2=0, t3=1, t4=1) 或读作 t0=0,t1=1,t2=1,t3=1,t4=0

> 💡 **Additional notes:** 注意t0时C=1但B=0，所以B·C=0不触发Set

---

## Q2 - Shannon展开 (Shannon Expansion) (6分)
**Problem:** 将X=f(A,B,C,X)分解为Shannon展开形式
**[English]** Decompose X=f(A,B,C,X) using Shannon expansion

> 💡 **Additional notes:** 使用卡诺图推导f₀(A,B,C)和f₁(A,B,C)

---

## Q3 - 等价逻辑函数 (Equivalent Logic Functions) (4分)
**Problem:** 勾选所有具有等价函数的逻辑函数
**[English]** Check all logic functions that have an equivalent function

```vhdl
y1 <= (not A and not C) or (A and C and not D);
y2 <= (not A or C) and (not A or not D) and (A or not C);
y3 <= (not A and not C) xor (A and not D);
y4 <= (A xnor C) and (not C or not D);
```

> 💡 **Additional notes:** XNOR = 同或门 (Equivalence gate)，A XNOR C = NOT(A XOR C)

---

## Q4 - 10位运算 (10-bit Arithmetic) (2分)
**Problem:** 4x1023的低10位存入10位寄存器
**[English]** Store lower 10 bits of 4x1023 into a 10-bit register

**Calculation:**
- 4 x 1023 = 4092
- 4092 mod 1024 = 1020

**Official answer:**
- a) unsigned: 1020
- b) signed: -4 (Two's Complement)

> 💡 **Additional notes:** 1023 = 2¹⁰-1 = -1 (signed)，所以4×(-1) = -4

---

## Q5 - 全加器设计 (Full Adder Design) (4分)
**Problem:** 画出全加器电路图
**[English]** Draw the full adder circuit diagram

> 💡 **Additional notes:**
> ```
> Sum = A ⊕ B ⊕ Cin
> Cout = (A·B) + (Cin·(A⊕B))
> ```

---

## Q6 - +1加法器设计 (Incrementer Design) (5分)
**Problem:** 不使用全加器，用简单门实现+1加法器
**[English]** Implement +1 adder using simple gates without full adder

**Official answer:**
```
s0 = not x0           (最低位取反)
s1 = x1 xor x0        (异或进位)
s2 = x2 xor (x1 and x0)
s3 = x3 xor (x2 and x1 and x0)
s4(carry) = x3 and x2 and x1 and x0
```

> 💡 **Additional notes:** +1加法器 (Incrementer) 比通用加法器简单，只需XOR和AND链

---

## Q7 - Gray码转换器VHDL (Gray Code Converter) (5分)
**Problem:** 用单个并发语句描述电路
**[English]** Describe the circuit with a single concurrent statement

**Official answer:**
```vhdl
y <= ('0' & x(3 downto 1)) xor x;
```

> 💡 **Additional notes (Binary to Gray Code)：**
> - Gray码公式：Gᵢ = Bᵢ ⊕ Bᵢ₊₁
> - VHDL实现：右移1位后与原值XOR

---

## Q8 - 移位寄存器VHDL分析 (Shift Register Analysis) (10分)
**Problem:** 分析代码并画出电路
**[English]** Analyze the code and draw the circuit

**Official answer:** 带并行加载的移位寄存器 (Shift Register with Parallel Load)

> 💡 **Additional notes:** 识别关键特征：
> - `rising_edge(clk)` → DFF寄存器
> - `rg(N-2 downto 0) & din` → 左移
> - 并行加载控制 → MUX选择

---

## Q9 - 直接映射Cache (Direct-Mapped Cache) (10分)
> 🛑 **Not on exam:** 根据2026年考试说明，Cache未命中计算题本次不考，可战略性跳过。

**Problem:** 32位处理器，256字节cache，直接映射，行长4字 (4-word line)
**[English]** 32-bit processor, 256-byte cache, direct-mapped, 4-word line

**访问序列及判断：**
| 地址 | cache hit |
|------|-----------|
| 0x14 | miss |
| 0x18 | hit |
| 0x2C | miss |
| 0x24 | hit |
| 0x118 | miss |
| 0x10 | miss |
| 0x11C | miss |
| 0x110 | hit |

> 💡 **Additional notes (Cache Structure)：**
> - 行大小4字 = 16字节 → offset = 4位
> - 256/16 = 16 sets → set index = 4位
> - 地址格式：`[tag][4位set][4位offset]`
> - 0x10和0x118映射到同一set（冲突miss）
