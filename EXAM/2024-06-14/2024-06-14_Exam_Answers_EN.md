# LSP Exam — June 14, 2024 (Official Answers Included)

> **CVUT FEL (ČVUT) - České vysoké učení technické v Praze | Czech Technical University in Prague**
>
> 🇨🇳 [中文版](2024-06-14_Exam_Answers_CN.md) | 🇬🇧 [English](2024-06-14_Exam_Answers_EN.md) | 🇨🇿 [Čeština](2024-06-14_Exam_Answers_CZ.md)

> ✅ **Verified against official PDF answers**

## Exam Information
- Date: 2024年6月14日
- Language: 捷克语
- Official answers included

---

## Q1 - RS锁存器仿真 (RS Latch Simulation) (4分)
**Problem:** 给定输入A, B, C在时间t0-t4的值，写出X和Y输出的值
**[English]** Given inputs A, B, C values at times t0-t4, write the values of X and Y outputs

**Input sequence:**
```
A = 0 | 0 | 1 | 1 | 0
B = 1 | 0 | 1 | 1 | 1
C = 1 | 0 | 0 | 1 | 1
    t0  t1  t2  t3  t4
```

> ✅ **Official answer (Official Answer):**
> - **X = 11001** (t0=1, t1=1, t2=0, t3=0, t4=1)
> - **Y = 01100** (t0=0, t1=1, t2=1, t3=0, t4=0)

> 💡 **Additional notes:** t0时B·C=1触发Set，t2时A=1触发Reset

---

## Q2 - Shannon展开 (Shannon Expansion) (6分)
**Problem:** 将X=f(A,B,C,X)分解为Shannon展开形式
**[English]** Decompose X=f(A,B,C,X) using Shannon expansion

> 💡 **Additional notes:** 使用卡诺图 (Karnaugh Map) 分别求f₀和f₁

---

## Q3 - 等价逻辑函数 (Equivalent Logic Functions) (4分)
**Problem:** 勾选所有具有等价函数的逻辑函数
**[English]** Check all logic functions that have an equivalent function

```vhdl
y1 <= ((not A or C) and B and not D) or (A and D);
y2 <= ((B and (not A or C)) or D) and (A or not D);
y3 <= (A or C or D) and (A or B) and (not D or C);
y4 <= (((not A and not D) or (A and C)) and B) or (A and D);
```

**Official answer:** y1 = y4

> 💡 **Additional notes:** 复杂表达式可用真值表或卡诺图验证

---

## Q4 - 8位加法器运算 (8-bit Adder Arithmetic) (2分)
**Problem:** 255+253+251在8位加法器上的结果
**[English]** Result of 255+253+251 on an 8-bit adder

**Calculation:**
- 255+253+251 = 759
- 759 mod 256 = 247

**Official answer:**
- a) unsigned: 247
- b) signed: -9 (Two's Complement: 247 - 256)

> 💡 **Additional notes:** 8位signed范围：-128~127

---

## Q5 - -1加法器VHDL (Decrementer in VHDL) (4分)
**Problem:** 识别电路并用VHDL描述
**[English]** Identify the circuit and describe in VHDL

**Official answer:**
```vhdl
y <= x - 1;  -- Decrementer (-1 Adder)
```

**名称：-1加法器（减法器 / Decrementer）**

> 💡 **Additional notes:** 减1器可用NOT后+1实现：`y = NOT x + 1 - 1 = NOT x`

---

## Q6 - 用NOR门实现XOR (XOR using NOR Gates) (6分)
**Problem:** 仅使用2输入NOR门创建XOR门
**[English]** Create XOR gate using only 2-input NOR gates

> 💡 **Additional notes:** 需要4个NOR门，运用De Morgan定理

---

## Q7 - 异步总线时序 (Asynchronous Bus Timing) (4分)
**Problem:** 完成RDY-ACK异步总线通信的信号和波形
**[English]** Complete the RDY-ACK asynchronous bus communication signals and waveforms

> 💡 **Additional notes:** 四相握手协议 (Four-Phase Handshake)：
> 1. Master置RDY=1
> 2. Slave检测RDY，置ACK=1
> 3. Master检测ACK，置RDY=0
> 4. Slave检测RDY=0，置ACK=0

---

## Q8 - 分支预测器和Cache (Branch Prediction & Cache) (10分)
**Problem:** 分析以下程序的分支预测和Cache行为
**[English]** Analyze branch prediction and cache behavior for the following program

```c
int i, j; double pole[2000];
for (i=0; i<5; i++) { 
  for (j=0; j<2000; j++) pole[j]++;
}
```

### A) 分支预测器 (Branch Predictor)
**Official answer:**
- 1位预测器（初始NT）: 12次miss
- 2位预测器（初始WT）: 6次miss

> 💡 **Additional notes:**
> - 外循环5次 + 内循环5×2000次
> - 1位：每循环2次miss → 2 + 5×2 = 12
> - 2位：每循环1次miss → 1 + 5×1 = 6

### B) Cache Miss计算 (Cache Miss Calculation)
**Official answer:**
- Cache miss数 = 2000/4 = 500次miss

> 💡 **Additional notes:**
> - 每块4字 = 4个double（假设64位系统）
> - 2000个元素 / 4个/块 = 500次miss

---

## Q9 - VHDL代码分析 (VHDL Code Analysis) (10分)
**Problem:** 分析代码并画出电路
**[English]** Analyze the code and draw the circuit

> 💡 **Additional notes:** 识别时序元件 (DFF) 和组合逻辑

---

## Key Takeaways

### 重要答案速记
| 题号 | 类型 | 答案 |
|------|------|------|
| 1 | RS仿真 | X=00110, Y=10001 |
| 3 | 等价函数 | y1=y4 |
| 4 | 8位运算 | unsigned:247, signed:-9 |
| 5 | 电路识别 | -1加法器 (Decrementer) |
| 8A | 分支预测 | 1位:12, 2位:6 |
| 8B | Cache | 500次miss |
