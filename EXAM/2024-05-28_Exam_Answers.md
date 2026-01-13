# LSP考试 2024年5月28日（含答案）
> ✅ **本文件已核对PDF官方答案 (Official Answers Verified from PDF)**

## 考试信息
- 日期：2024年5月28日
- 语言：捷克语
- 包含官方答案

---

## 第1题 - RS锁存器仿真 (RS Latch Simulation) (4分)
**题目：** 给定输入A, B, C在时间t0-t4的值，写出X和Y输出的值
**[English]** Given inputs A, B, C values at times t0-t4, write the values of X and Y outputs

**输入序列：**
```
A = 0 | 0 | 0 | 1 | 0
B = 1 | 1 | 0 | 1 | 1
C = 0 | 1 | 0 | 0 | 0
    t0  t1  t2  t3  t4
```

> ✅ **官方参考答案 (Official Answer):**
> - **X = 11001** (t0=1, t1=1, t2=0, t3=0, t4=1)
> - **Y = 01100** (t0=0, t1=1, t2=1, t3=0, t4=0)

> 💡 **补充解析：** t1时B·C=1触发Set使Y=0？需要根据具体电路确认

---

## 第2题 - Shannon展开 (Shannon Expansion) (6分)
**题目：** 将X=f(A,B,C,X)分解为Shannon展开形式
**[English]** Decompose X=f(A,B,C,X) using Shannon expansion

> 💡 **补充解析：** Shannon定理：f(X) = X̄·f(0) + X·f(1)

---

## 第3题 - 等价逻辑函数 (Equivalent Logic Functions) (4分)
**题目：** 勾选所有具有等价函数的逻辑函数
**[English]** Check all logic functions that have an equivalent function

```vhdl
y1 <= (D or A) and (not D or C or A);
y2 <= (not D and A) or (D and not A) or (C and A);
y3 <= C or (D and C and B) or (not D and C and A);
y4 <= (C and A) or (not D xor not A);
```

**官方答案：** y2 = y4

> 💡 **补充解析：**
> - y2 = D̄A + DĀ + CA = (A ⊕ D) + CA
> - y4 = CA + (D̄ ⊕ Ā) = CA + (A ⊕ D) （∵ D̄⊕Ā = A⊕D）

---

## 第4题 - 9位加法器运算 (9-bit Adder Arithmetic) (2分)
**题目：** 254+255+256+257在9位加法器上的结果
**[English]** Result of 254+255+256+257 on a 9-bit adder

**计算：**
- 254+255+256+257 = 1022
- 1022 mod 512 = 510

**官方答案：**
- a) unsigned: 510
- b) signed: -2 (Two's Complement: 510 - 512)

> 💡 **补充解析：** 9位范围：unsigned 0~511，signed -256~255

---

## 第5题 - Moore/Mealy自动机定义 (FSM Definition) (4分)
**题目：** 完成定义
**[English]** Complete the definition

> 💡 **补充解析：**
> - Moore: M = <X, S, Z, δ, ω, s₀>，其中 ω: S → Z
> - Mealy: M = <X, S, Z, δ, ω, s₀>，其中 ω: S×X → Z

---

## 第6题 - 多路复用器电路实现 (Multiplexer Implementation) (6分)
**题目：** 用AND、NAND、OR、NOR和NOT门实现级联多路复用器
**[English]** Implement cascaded multiplexer using AND, NAND, OR, NOR and NOT gates

> 💡 **补充解析：** 2选1 MUX = (S̄·A) + (S·B)，需要2个AND + 1个OR + 1个NOT

---

## 第7题 - 多路复用器VHDL描述 (MUX in VHDL) (8分)
**题目：** 用并发和顺序语句描述
**[English]** Describe using concurrent and sequential statements

> 💡 **补充解析：**
> - 并发 (Concurrent)：`y <= a when sel='1' else b;`
> - 顺序 (Sequential)：`if sel='1' then y <= a; else y <= b; end if;`

---

## 第8题 - 分支预测器 (Branch Predictor) (6分)
**题目：** C程序查找最小值，计算分支预测错误次数
**[English]** C program finds minimum, calculate branch misprediction count

**官方答案：** 两种预测器都是7次miss

> 💡 **补充解析：** 
> 查找最小值程序的if分支取决于数据分布
> 对于随机数据，平均约log₂(n)次更新最小值

---

## 第9题 - 解复用器设计 (Demultiplexer Design) (10分)
**题目：** 画出代码的符号和内部电路
**[English]** Draw the symbol and internal circuit of the code

**官方答案：** 代码描述的是解复用器 (Demultiplexer / DEMUX)

> 💡 **补充解析：**
> - MUX：多输入→单输出，选择器
> - DEMUX：单输入→多输出，分配器
> - DEMUX公式：Yᵢ = D · (sel = i)
