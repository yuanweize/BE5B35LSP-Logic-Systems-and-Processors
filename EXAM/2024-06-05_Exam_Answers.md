# LSP考试 2024年6月5日（含答案）

## 考试信息
- 日期：2024年6月5日
- 语言：捷克语
- 包含官方答案

---

## 第1题 - RS锁存器仿真 (4分)
**题目：** 给定输入A, B, C在时间t0-t4的值，写出X和Y输出的值
**[English]** Given inputs A, B, C values at times t0-t4, write the values of X and Y outputs

**输入序列：**
```
A = 0 | 0 | 1 | 0 | 0
B = 0 | 0 | 0 | 1 | 0
C = 1 | 0 | 0 | 1 | 1
    t0  t1  t2  t3  t4
```

**官方答案：**
```
X = 1 | 1 | 0 | 0 | 1
Y = 0 | 1 | 1 | 1 | 0
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
y1 <= (not A and not C) or (A and C and not D);
y2 <= (not A or C) and (not A or not D) and (A or not C);
y3 <= (not A and not C) xor (A and not D);
y4 <= (A xnor C) and (not C or not D);
```

---

## 第4题 - 10位运算 (2分)
**题目：** 4x1023的低10位存入10位寄存器
**[English]** Store lower 10 bits of 4x1023 into a 10-bit register

**计算：**
- 4 x 1023 = 4092
- 4092 mod 1024 = 1020

**官方答案：**
- a) unsigned: 1020
- b) signed: -4

---

## 第5题 - 全加器设计 (4分)
**题目：** 画出全加器电路图
**[English]** Draw the full adder circuit diagram

---

## 第6题 - +1加法器设计 (5分)
**题目：** 不使用全加器，用简单门实现+1加法器
**[English]** Implement +1 adder using simple gates without full adder

**官方答案：**
```
s0 = not x0
s1 = x1 xor x0
s2 = x2 xor (x1 and x0)
s3 = x3 xor (x2 and x1 and x0)
s4(carry) = x3 and x2 and x1 and x0
```

---

## 第7题 - Gray码转换器VHDL (5分)
**题目：** 用单个并发语句描述电路
**[English]** Describe the circuit with a single concurrent statement

**官方答案：**
```vhdl
y <= ('0' & x(3 downto 1)) xor x;
```

---

## 第8题 - 移位寄存器VHDL分析 (10分)
**题目：** 分析代码并画出电路
**[English]** Analyze the code and draw the circuit

**官方答案：** 带并行加载的移位寄存器

---

## 第9题 - 直接映射Cache (10分)
**题目：** 32位处理器，256字节cache，直接映射，行长4字
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
