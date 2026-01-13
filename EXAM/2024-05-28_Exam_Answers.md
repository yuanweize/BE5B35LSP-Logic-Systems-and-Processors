# LSP考试 2024年5月28日（含答案）

## 考试信息
- 日期：2024年5月28日
- 语言：捷克语
- 包含官方答案

---

## 第1题 - RS锁存器仿真 (4分)
**题目：** 给定输入A, B, C在时间t0-t4的值，写出X和Y输出的值
**[English]** Given inputs A, B, C values at times t0-t4, write the values of X and Y outputs

**输入序列：**
```
A = 0 | 0 | 0 | 1 | 0
B = 1 | 1 | 0 | 1 | 1
C = 0 | 1 | 0 | 0 | 0
    t0  t1  t2  t3  t4
```

**官方答案：**
```
X = 0 | 0 | 1 | 1 | 0
Y = 1 | 0 | 0 | 0 | 1
```

---

## 第2题 - Shannon展开 (6分)
**题目：** 将X=f(A,B,C,X)分解为Shannon展开形式
**[English]** Decompose X=f(A,B,C,X) using Shannon expansion

---

## 第3题 - 等价逻辑函数 (4分)
**题目：** 勾选所有具有等价函数的逻辑函数
**[English]** Check all logic functions that have an equivalent function

```vhdl
y1 <= (D or A) and (not D or C or A);
y2 <= (not D and A) or (D and not A) or (C and A);
y3 <= C or (D and C and B) or (not D and C and A);
y4 <= (C and A) or (not D xor not A);
```

**官方答案：** y2 = y4

---

## 第4题 - 9位加法器运算 (2分)
**题目：** 254+255+256+257在9位加法器上的结果
**[English]** Result of 254+255+256+257 on a 9-bit adder

**计算：**
- 254+255+256+257 = 1022
- 1022 mod 512 = 510

**官方答案：**
- a) unsigned: 510
- b) signed: -2

---

## 第5题 - Moore/Mealy自动机定义 (4分)
**题目：** 完成定义
**[English]** Complete the definition

---

## 第6题 - 多路复用器电路实现 (6分)
**题目：** 用AND、NAND、OR、NOR和NOT门实现级联多路复用器
**[English]** Implement cascaded multiplexer using AND, NAND, OR, NOR and NOT gates

---

## 第7题 - 多路复用器VHDL描述 (8分)
**题目：** 用并发和顺序语句描述
**[English]** Describe using concurrent and sequential statements

---

## 第8题 - 分支预测器 (6分)
**题目：** C程序查找最小值，计算分支预测错误次数
**[English]** C program finds minimum, calculate branch misprediction count

**官方答案：** 两种预测器都是7次miss

---

## 第9题 - 解复用器设计 (10分)
**题目：** 画出代码的符号和内部电路
**[English]** Draw the symbol and internal circuit of the code

**官方答案：** 代码描述的是解复用器
