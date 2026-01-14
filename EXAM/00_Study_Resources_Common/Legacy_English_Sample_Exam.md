# LSP英文考试样题（含答案）

## 考试信息
- 文件：Eng_SampleOfExam.pdf
- 语言：英语
- 内容：往年英文考试样题及解答

---

## 第1题 - De Morgan展开 (4分)
**题目：** 将XOR转换为只含AND、OR、NOT的形式
**[English]** Convert XOR to form containing only AND, OR, NOT

**F1 = A xor (B or C)**
```vhdl
F1 <= (A and not B and not C) or (not A and (B or C));
```

**F2 = not (A and (B xor C))**
```vhdl
F2 <= not A or ((not B or C) and (B or not C));
```

---

## 第2题 - RS锁存器仿真 (5分)
**输入序列：**
```
A = 1|1|0|0|1
B = 0|1|1|1|1
C = 0|0|0|1|1
    t0|t1|t2|t3|t4
```

**✅ 答案：**
```
X = 0|1|1|1|0
Y = 1|0|0|1|1
```

---

## 第3题 - Shannon展开 (6分)
**题目：** 将X=f(A,B,C,X)分解为
**[English]** Decompose X=f(A,B,C,X) into
```
X = (not X and f₀(A,B,C)) or (X and f₁(A,B,C))
```

**✅ 答案（卡诺图）：**
```
f0:     B               f1:     B
       A 0  1                  A 0  1
    ┌─────┬─────          ┌─────┬─────
C 0 │  1  │  0  │  1  │  0   │  1  │  0  │  1  │  1
  1 │  0  │  1  │  0  │  1   │  1  │  1  │  0  │  1
```

---

## 第4题 - 二进制数解释 (2分)
**题目：** 12位数 1000 0000 0111 的十进制值
**[English]** Decimal value of 12-bit number 1000 0000 0111

**计算：**
- 二进制：1000 0000 0111 = 2^11 + 7 = 2048 + 7 = 2055

**✅ 答案：**
- a) **unsigned**: **2055**
- b) **signed**: **-2041** (2055 - 4096 = -2041)

---

## 第5题 - 等价逻辑函数 (6分)
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

## 第6题 - 主从D触发器 (7分)
**题目：** 用4个NAND门和3个NOT门构建主从D触发器
**[English]** Build a master-slave D flip-flop using 4 NAND gates and 3 NOT gates

**结构：**
```
        ┌─────────────────────────────────┐
DATA ──►│ NAND1 ├──► NAND2 ├──────► NAND3 ├──► Q
        │       │   │      │       │      │
Clock ──►───────►   │      └──NOT──┘      │
        │ NAND4 ├───┘                     │
        └─────────────────────────────────┘
```

**说明：**
- 主锁存器：Clock高电平时透明
- 从锁存器：Clock低电平时透明
- 整体在Clock上升沿采样

---

## 第7题 - 上下计数器接线 (15分)
**题目：** 机械传感器检测产品通过，Remove按钮移除产品
**[English]** Mechanical sensor detects product passing, Remove button removes product

**需要添加的元件：**
1. 上拉电阻（10-100kΩ）
2. 去抖动电容（0.047µF）
3. 限流电阻（10kΩ）

**电路要点：**
- 传感器 → Plus1（计数+1）
- Remove按钮 → Minus1（计数-1）
- 需要消抖处理

---

## 第8题 - VHDL代码分析 (15分)
**代码：**
```vhdl
library ieee; use ieee.std_logic_1164.all;
entity XXX is port(A, B, C, D : in std_logic; Q : out std_logic); end;
architecture rtl of XXX is 
  constant E: std_logic := '0'; 
begin 
  process(A, D)
    variable qv: std_logic; 
  begin 
    if D='0' then 
      qv := E;  -- 异步清零
    elsif rising_edge(A) then
      if C='1' then 
        qv := B;  -- 加载
      else 
        qv := not qv;  -- 翻转
      end if;
    end if;
    Q <= qv;
  end process; 
end rtl;
```

**✅ 答案：带异步清零的T触发器/可加载触发器**

**功能：**
- D='0'：异步清零
- C='1'：加载B
- C='0'：输出翻转（T触发器行为）

---

## 2021年12月21日考试附加题

### 第1题 - 等价逻辑函数 (8分)
```vhdl
y1 <= (D and not C) or (not C and A) or (D and B);
y2 <= (D and C) xor (B and A);
y3 <= (D or A) and (not C or B) and (D or not C);
y4 <= (D and B) or (D and not C and not B) or ((D xor A) and not C);
```

**✅ 答案：** y1 ≡ y3

### 第4题 - 用NAND实现XOR (3分)
```
A XOR B = ((A NAND (A NAND B)) NAND (B NAND (A NAND B)))
```

**需要4个NAND门**

### 第5题 - 全加器 (3分)
```
Sum = A ⊕ B ⊕ Cin
Cout = (A · B) + (Cin · (A ⊕ B))
```

### 第6题 - +1加法器 (3分)
```
Y0 = NOT A0
Y1 = A1 XOR A0
Y2 = A2 XOR (A1 AND A0)
Y3 = A3 XOR (A2 AND A1 AND A0)
```

### 第7题 - CMOS电机控制 (10分)
**题目：** 一次按下开启电机，再次按下关闭电机，上电默认关闭
**[English]** One press turns motor on, another press turns it off, default off at power-up

**需要添加：**
1. DFF的D连接到Q̄（Toggle功能）
2. 按钮到CLK（通过去抖动电路）
3. 上电复位电路到CLRN
4. 继电器控制电路

### 第8题 - VHDL代码分析 (10分)
**代码：**
```vhdl
library IEEE; use IEEE.STD_LOGIC_1164.all;
entity xxx is port (a, b, c : in std_logic; d : out std_logic); end;
architecture rtl of xxx is 
begin 
  process(a, b, c) 
    variable z: std_logic_vector(0 to 3);
  begin 
    if a = '0' then 
      z := "0001";
    elsif rising_edge(b) then 
      z := z(1 to 3) & z(0);  -- 左循环移位
      if c='1' then 
        d <= not z(3); 
      else 
        d <= z(3); 
      end if;
    end if; 
  end process; 
end rtl;
```

**✅ 答案：带预置的4位环形移位寄存器**

**功能：**
- a='0'：预置为"0001"
- b上升沿：左循环移位
- c：控制输出是否取反

---

## ⭐ 重要知识点总结

### 1. De Morgan定律
```
NOT(A AND B) = (NOT A) OR (NOT B)
NOT(A OR B) = (NOT A) AND (NOT B)
A XOR B = (A AND NOT B) OR (NOT A AND B)
A XNOR B = (A AND B) OR (NOT A AND NOT B)
```

### 2. 12位有符号数
- 范围：-2048 ~ 2047
- 转换：val > 2047 → val - 4096

### 3. 用NAND实现基本门
- NOT A = A NAND A
- A AND B = (A NAND B) NAND (A NAND B)
- A OR B = (A NAND A) NAND (B NAND B)
- A XOR B = 需要4个NAND门

### 4. 全加器公式
```
Sum = A ⊕ B ⊕ Cin
Cout = (A · B) + (Cin · (A ⊕ B))
     = (A · B) + (A · Cin) + (B · Cin)  -- MAJ函数
```

### 5. +1加法器规律
```
Y[i] = A[i] XOR (A[i-1] AND A[i-2] AND ... AND A[0])
```
即：当前位翻转，当且仅当所有低位都是1
