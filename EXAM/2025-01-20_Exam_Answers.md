# LSP考试 2025年1月20日（英文版，含答案）

## 考试信息
- 日期：2025年1月20日
- 语言：英语
- 包含官方答案

---

## 第1题 - RS锁存器仿真 (5分)
**题目：** 给定输入A, B, C在时间t0-t4的值，写出X和Y输出的值
**[English]** Given inputs A, B, C values at times t0-t4, write the values of X and Y outputs

**输入序列：**
```
A = 0 | 0 | 1 | 1 | 0
B = 1 | 0 | 1 | 1 | 1
C = 1 | 0 | 0 | 1 | 1
    t0  t1  t2  t3  t4
```

**✅ 官方答案：**
```
X = 0 | 0 | 1 | 1 | 0
Y = 1 | 0 | 0 | 0 | 1
```

---

## 第2题 - Shannon展开 (6分)
**题目：** 将X=f(A,B,C,X)分解为Shannon展开形式
**[English]** Decompose X=f(A,B,C,X) using Shannon expansion

**✅ 官方答案（卡诺图）：**
```
f0:     B               f1:     B
       A  0  1                 A  0  1
    ┌─────┬─────          ┌─────┬─────
C 0 │  0  │  0  │  1  │  0   │  0  │  0  │  1  │  0
  1 │  0  │  0  │  0  │  0   │  0  │  0  │  1  │  0
```

---

## 第3题 - 等价逻辑函数 (4分)
**题目：** 勾选所有具有等价函数的逻辑函数
**[English]** Check all logic functions that have an equivalent function

```vhdl
y1 <= ((not A or C) and B and not D) or (A and D);
y2 <= ((B and (not A or C)) or D) and (A or not D);
y3 <= (A or C or D) and (A or B) and (not D or C);
y4 <= (((not A and not D) or (A and C)) and B) or (A and D);
```

**✅ 官方答案：** y1 ≡ y4

---

## 第4题 - 10位加法器运算 (4分)
**题目：** 1023+1023+1023+1023在10位加法器上的结果
**[English]** Result of 1023+1023+1023+1023 on a 10-bit adder

**计算：**
- 1023 = 2^10 - 1
- 4 × 1023 = 4092
- 4092 mod 1024 = 1020

**✅ 官方答案：**
- a) **unsigned**: **(1024-1)×4 = 1024-4 = 1020**
- b) **signed**: **1023表示-1，4×(-1) = -4**

**注意：** 在10位加法器中，1024 = 0，因此N×1024 = 0
参考：Binary Prerequisite

---

## 第5题 - 全加器设计 (6分)
**题目：** 设计一个全加器电路
**[English]** Design a full adder circuit

**答案：** 见第13讲

**全加器公式：**
```
Sum = A ⊕ B ⊕ Cin
Cout = (A ∧ B) ∨ (Cin ∧ (A ⊕ B))
```

---

## 第6题 - 用NOR门实现XOR (5分)
**题目：** 仅使用NOR门实现XOR功能
**[English]** Implement XOR using only NOR gates

**提示：** 使用De Morgan定律

**✅ 官方答案：**
```
A xor B = (A nor B) nor ((A nor A) nor (B nor B))
```

---

## 第7题 - Gray码转换器VHDL (10分)
**题目：** 用单个并发语句描述电路
**[English]** Describe the circuit using a single concurrent statement

**✅ 官方答案：**
```vhdl
library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all;
entity Test20250120q7 is 
  port(x: in std_logic_vector(3 downto 0); 
       y: out std_logic_vector(3 downto 0)); 
end entity;
architecture rtl of Test20250120q7 is
begin
  y <= ('0' & x(3 downto 1)) xor x;  -- 第4讲第8页
end architecture rtl;
```

---

## 第8题 - 分支预测器和Cache (10分)
**题目：** 分析程序的分支预测和Cache miss
**[English]** Analyze the branch prediction and cache miss of the program

**程序：**
```c
int i, j; double arr[2000];
for (i=0; i<5; i++) { 
  for (j=0; j<2000; j++) arr[j]++;
}
```

### A) 分支预测器
**题目：** 计算1位和2位分支预测器的miss次数
**[English]** Calculate the number of misses for 1-bit and 2-bit branch predictors

**✅ 官方答案：**
- **1位预测器（初始NT）**: 2（外循环） + 5×2（内循环） = **12次miss**
- **2位预测器（初始WT）**: 1（外循环） + 5×1（内循环） = **6次miss**

### B) Cache Miss计算
**题目：** 64位处理器，直接映射，32KB cache，块长4字，计算cache miss次数
**[English]** 64-bit processor, direct-mapped, 32KB cache, 4-word block, calculate cache miss count

- 数组从0x100000开始

**✅ 官方答案：**
- 2000个double元素 × 8字节 = 16000字节 → 可完全放入32KB cache
- 第一次读取时加载到cache，后续都是hit
- 每块4字 × 8字节（64位） = 32字节，包含4个double
- 数组起始地址可被4整除（块对齐），无额外miss
- Cache miss数 = 数组元素数 / 每块元素数 = 2000/4 = **500次miss**

---

## 知识点总结

### ✅ 重要答案速记（高频考点！）
| 题号 | 类型 | 答案 |
|------|------|------|
| 1 | RS仿真 | X=00110, Y=10001 |
| 3 | 等价函数 | y1≡y4 |
| 4 | **10位运算** | **unsigned:1020, signed:-4** |
| 7 | Gray码VHDL | y <= ('0' & x(3 downto 1)) xor x |
| 8A | 分支预测 | **1位:12, 2位:6** |
| 8B | Cache | **500次miss** |

### ⭐ 必背公式

#### 10位有符号/无符号运算
- 1023在10位unsigned = 1023
- 1023在10位signed = -1（因为是全1）
- 4×1023 mod 1024 = 1020 (unsigned)
- 4×(-1) = -4 (signed)

#### 分支预测miss计算
**For循环编译为do-while：**
```c
// for (i=0; i<N; i++) body;
// 编译为：
i = 0;
do {
  body;
  i++;
} while (i < N);  // 这里是分支
```

**1位预测器（初始NT）：**
- 循环开始：预测NT，实际T → **miss**，变为T
- 循环中：预测T，实际T → hit
- 循环结束：预测T，实际NT → **miss**
- 每个循环2次miss

**2位预测器（初始WT）：**
- 循环开始：预测T，实际T → hit
- 循环结束：预测ST，实际NT → **miss**
- 每个循环1次miss

#### Cache Miss计算
```
Cache Miss = 数据大小 / 块大小
           = (元素数 × 元素大小) / (字数/块 × 字大小)
           = 元素数 / (字数/块 × 字大小/元素大小)
```

对于64位处理器：
- 字大小 = 8字节
- double = 8字节
- 每块4字 = 32字节 = 4个double
- 2000个double → 2000/4 = 500次miss
