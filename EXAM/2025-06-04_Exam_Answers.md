# LSP考试 2025年6月4日（含答案）

## 考试信息
- 日期：2025年6月4日
- 语言：捷克语
- 版本：V1.1（已修正直方图）
- 包含官方答案

---

## 第1题 - RS锁存器仿真 (5分)
**题目：** 输入A、B、C在时间t0到t4的值如图所示。写出X和Y输出的值。
**[English]** Inputs A, B, C had values shown in the figure at times t0 to t4. Write the values of X and Y outputs.

**输入序列：**
```
A = 1 | 0 | 0 | 1 | 0
B = 0 | 0 | 0 | 1 | 0
C = 0 | 0 | 1 | 0 | 1
    t0  t1  t2  t3  t4
```

---

## 第2题 - Shannon展开 (8分)
**题目：** 将第1题电路的函数X=f(A,B,C,X)用Shannon展开分解为：X=(not X and f0(A,B,C)) or (X and f1(A,B,C))。
**[English]** Decompose the function X=f(A,B,C,X) from question 1 into the form X=(not X and f0(A,B,C)) or (X and f1(A,B,C)) using Shannon expansion.

**✅ 官方答案（卡诺图）：**
```
f0:     B                    f1:     B
       A  0  1                      A  0  1
C 0   0  1  1  1          C 0   1  1  1  1
  1   0  1  1  1            1   0  1  1  1
```

**✅ 简化表达式：**
```
X = (X and not C) or A or B
```

---

## 第3题 - 等价逻辑函数 (4分)
**题目：** 勾选所有与其他函数等价的逻辑函数。
**[English]** Check all logic functions that have another equivalent function here.

```vhdl
x1 <= (B and not A) or (A and not B);
x2 <= (A and not C) xor (C and A);
x3 <= (B or A) and (not B or not A);
x4 <= (C xor A) or (B and not A);
```

**✅ 答案：** x1 ≡ x3 (都等于 A XOR B)

---

## 第4题 - 9位寄存器运算 (2分)
**题目：** 将4×510运算结果的低位存入9位寄存器，作为9位数的十进制值是多少？
**[English]** If we store the lower bits of 4×510 operation into a 9-bit register, what decimal value will it hold as a 9-bit number?

**✅ 官方计算：**
```
4 × 510 = 4 × (2^9 - 2) = 2^11 - 8
取低9位: ≡ 2^9 - 8 = 512 - 8 = 504
```

**✅ 答案：**
- a) unsigned: **504**
- b) signed: **-8**

---

## 第5题 - 全加器电路 (6分)
**题目：** 画出一位全加器的电路图。
**[English]** Draw the schematic of a one-bit full adder.

**✅ 答案：**
```
Sum = A XOR B XOR Carry_in
Carry_out = (A AND B) OR (Carry_in AND (A XOR B))
```

---

## 第6题 - 4选1多路选择器VHDL (4+4分)
**题目：** 用VHDL分别用一条并发语句和一条顺序语句描述图中电路。
**[English]** Describe the circuit in the figure using VHDL with both one concurrent statement and one sequential statement.

**✅ 并发语句答案：**
```vhdl
qcon <= z when a1='1' else y when a0='1' else x;
```

**✅ 顺序语句答案：**
```vhdl
process(all)
begin
  if a1='1' then qseq <= z; 
  elsif a0='1' then qseq <= y; 
  else qseq <= x;
  end if;
end process;
```

---

## 第7题 - 移位寄存器分析 (8+2分)
**题目：** 根据以下代码画出电路的方框图，并正确命名该电路。
**[English]** Draw the block diagram of the circuit described by the following code, and name the circuit correctly.

```vhdl
library ieee; use ieee.std_logic_1164.all;
entity Test20250604q7 is
  port (A, B : in std_logic;
        C : in std_logic_vector(3 downto 0);
        D : out std_logic);
end entity;
architecture rtl of Test20250604q7 is
begin
  process(A)
    variable rg: std_logic_vector(C'RANGE);
  begin 
    if rising_edge(A) then
      if B='1' then rg := C;
      else rg := rg(2 downto 0) & not rg(3);
      end if;
    end if;
    D <= rg(0);
  end process;
end architecture;
```

**✅ 电路名称：** 带预置的环形移位寄存器 / 约翰逊计数器（Johnson Counter）

---

## 第8题 - Cache映射 (分)
**题目：** 32位处理器有128字节直接映射cache，行大小为2字。填写地址映射表。
**[English]** A 32-bit processor has 128-byte direct-mapped cache with line size of 2 words. Fill in the address mapping table.

**Cache参数：** 128/(2×4) = 16 sets

**✅ 地址映射表：**
| 地址 | tag | set | block-offset |
|------|-----|-----|--------------|
| 0x10 | 0 | 2 | 0 |
| 0x14 | 0 | 2 | 1 |
| 0x28 | 0 | 5 | 0 |
| 0x2C | 0 | 5 | 1 |
| 0x94 | 1 | 2 | 1 |
| 0xA8 | 1 | 5 | 0 |
| 0xAC | 1 | 5 | 1 |

**✅ Cache Hit分析：**
| 地址 | Hit/Miss |
|------|----------|
| 0x10 | Miss |
| 0x14 | Hit |
| 0x28 | Miss |
| 0x94 | Miss |
| 0x2C | Hit |
| 0x10 | Miss |
| 0xA8 | Miss |
| 0xAC | Hit |
