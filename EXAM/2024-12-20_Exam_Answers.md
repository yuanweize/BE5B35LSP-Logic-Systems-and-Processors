# LSP考试 2024年12月20日（英文版，含答案）

## 考试信息
- 日期：2024年12月20日
- 语言：英语
- 包含官方答案

---

## 第1题 - RS锁存器仿真 (5分)
**题目：** 给定输入A, B, C在时间t0-t4的值，写出X和Y输出的值
**[English]** Given inputs A, B, C values at times t0-t4, write the values of X and Y outputs

**输入序列：**
```
A = 1 | 0 | 1 | 0 | 0
B = 0 | 1 | 0 | 0 | 0
C = 0 | 1 | 0 | 0 | 1
    t0  t1  t2  t3  t4
```

**官方答案：**
```
X = 1 | 1 | 1 | 1 | 0
Y = 0 | 1 | 0 | 0 | 1
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
x1 <= (B and not A) or (A and not B);
x2 <= (A and not C) xor (C and A);
x3 <= (B or A) and (not B or not A);
x4 <= (C xor A) or (B and not A);
```

**官方答案：** x1 = x3 (都是A XOR B)

---

## 第4题 - 9位加法器运算 (4分)
**题目：** 254+255+256+257在9位加法器上的结果
**[English]** Result of 254+255+256+257 on a 9-bit adder

**计算：**
- 254+255+256+257 = 1022
- 1022 mod 512 = 510

**官方答案：**
- a) unsigned: 510
- b) signed: -2

---

## 第5题 - Moore/Mealy自动机定义 (6分)
**题目：** 完成定义
**[English]** Complete the definition

M = < X, S, Z, w, d, s0 >
- X: 有限输入符号集合 / Finite input alphabet
- S: 有限状态集合 / Finite set of states
- Z: 有限输出符号集合 / Finite output alphabet
- d: 状态转移函数 / State transition function
- w: 输出函数 / Output function
- s0: 初始状态 / Initial state

---

## 第6题 - 多路复用器电路实现 (5分)
**题目：** 用AND、NAND、OR、NOR和NOT门实现级联多路复用器
**[English]** Implement cascaded multiplexer using AND, NAND, OR, NOR and NOT gates

---

## 第7题 - 多路复用器VHDL描述 (10分)
**题目：** 用并发和顺序语句描述
**[English]** Describe using concurrent and sequential statements

**官方答案：**
```vhdl
Qcon <= z when a1='1' else y when a0='1' else x;
```

---

## 第8题 - 直接映射Cache (10分)
**题目：** 32位处理器，256字节cache，直接映射，行长2字
**[English]** 32-bit processor, 256-byte cache, direct-mapped, 2-word line

**Cache访问结果：**
| 地址 | cache hit |
|------|-----------|
| 0x10 | miss |
| 0x14 | hit |
| 0x28 | miss |
| 0x94 | miss |
| 0x2C | hit |
| 0x10 | hit |
| 0xA8 | miss |
| 0xAC | hit |

---

## 知识点总结

### 重要答案速记
| 题号 | 类型 | 答案 |
|------|------|------|
| 1 | RS仿真 | X=11110, Y=01001 |
| 3 | 等价函数 | x1=x3 (A XOR B) |
| 4 | 9位运算 | unsigned:510, signed:-2 |
| 8 | Cache | hit: 0x14, 0x2C, 0x10, 0xAC |
