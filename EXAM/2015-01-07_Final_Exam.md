# LSP Final Exam - 2015年1月7日
> 🧠 **AI推演版本** - 以下为解析参考

---

## 题目1: 电路真值表与卡诺图

**题目**: 根据给定的电路图，创建真值表。将输出Y、Z按YZ顺序写入卡诺图。
**[English]** Create a truth table based on the given circuit diagram. Write outputs Y, Z into the Karnaugh map in YZ order.

```
输入: A, B, C, D, E
输出: Y, Z
```

| YZ | AB |
|----|-----|
|    | 00 01 10 11 |

---

## 题目2: 香农展开分解

**题目**: 将函数 `Q:=f(A,B,C,D)` 分解为以下形式：
**[English]** Decompose the function Q:=f(A,B,C,D) into the following form:

```
Q = f(A,B,C,D) := (A or B) and (((A and not B) xor (D and not A)) or (C and not D))
```

分解为：
```
Q = C̄·D̄·f0(A,B) + C̄·D·f1(A,B) + C·D̄·f2(A,B) + C·D·f3(A,B)
```

写出 f0, f1, f2, f3 的卡诺图。

### 答案

| f0 | A=0 | A=1 |
|----|-----|-----|
| B=0 | 0 | 1 |
| B=1 | 0 | 0 |

| f1 | A=0 | A=1 |
|----|-----|-----|
| B=0 | 1 | 1 |
| B=1 | 1 | 0 |

| f2 | A=0 | A=1 |
|----|-----|-----|
| B=0 | 0 | 1 |
| B=1 | 0 | 1 |

| f3 | A=0 | A=1 |
|----|-----|-----|
| B=0 | 0 | 1 |
| B=1 | 0 | 0 |

---

## 题目3: 等价逻辑函数 ⭐常考

**题目**: 标记所有与其他函数等价的逻辑函数：
**[English]** Mark all logic functions that are equivalent to other functions:

```vhdl
f1 <= (A xor C) or (A and not C);
f2 <= (B or C) and (not A or B or C);
f3 <= ((C and not B) or (B and A));
f4 <= (A or C) and (not A or not C);
f5 <= (A and not B) xor (A and C);
f6 <= (A and not C) or (C and not A);
```

### 解题方法
用卡诺图分别画出每个函数，找出相同的！

---

## 题目4: RS锁存器电路仿真 ⭐常考

**题目**: 输入A, B, C在时刻t0, t1, t2, t3的值如下，写出X和Y输出值。
**[English]** Given inputs A, B, C values at times t0, t1, t2, t3 as shown, write the X and Y output values.

```
A = ..0..|..1..|..1..|..1..|
B = ..0..|..0..|..0..|..1..|
C = ..1..|..1..|..0..|..0..|

t0   t1   t2   t3

X = _____|_____|_____|_____|
```

假设输入变化之间的间隔足够长，可以忽略门延迟。

---

## 题目5: 香农展开 ⭐常考

**题目**: 将题目4中的函数 `X=f(A,B,C,X)` 分解为：
**[English]** Decompose the function X=f(A,B,C,X) from question 4 into:

```
X = (not X and f0(A,B,C)) or (X and f1(A,B,C))
```

写出f0和f1的卡诺图。

---

## 题目6: VHDL移位寄存器

**题目**: 补全VHDL程序，创建100位移位寄存器。
**[English]** Complete the VHDL program to create a 100-bit shift register.

- q输出是d输入延迟100个clk时钟脉冲
- 寄存器由同步信号 `sclrn='0'` 清零
- 使用最短代码（提示：最短代码不包含循环）

```vhdl
library IEEE; use IEEE.STD_LOGIC_1164.all;
entity pos100 is port (clock, d, sclrn : in std_logic; q: out std_logic) end pos100;

-- 在此补全代码
architecture rtl of pos100 is
    signal reg : std_logic_vector(99 downto 0);
begin
    process(clock)
    begin
        if rising_edge(clock) then
            if sclrn = '0' then
                reg <= (others => '0');
            else
                reg <= d & reg(99 downto 1);
            end if;
        end if;
    end process;
    q <= reg(0);
end rtl;
```

---

## 知识点总结

1. **真值表与卡诺图** - 电路分析
2. **香农展开** - 函数分解技术
3. **等价逻辑函数** - 用卡诺图判断
4. **RS锁存器仿真** - 时序分析
5. **VHDL编程** - 移位寄存器设计
