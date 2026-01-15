> 🌍 **Language**: [🇬🇧 English (Main)](./README.md) | [🇨🇿 Čeština (CZ)](./README_CZ.md)

# 🎓 LSP - 逻辑系统与处理器

> **课程**: LSP (Logické systémy a procesory) - Logic Systems and Processors  
> **学校**: CTU FEL Prague (捷克理工大学电气工程学院)  
> **更新**: 2026年1月15日

---

## 📚 仓库简介

本仓库包含 CTU FEL LSP 课程的完整学习资料，包括：
- 📝 历年考试真题与答案 (2015-2026)
- 📖 课程笔记与复习指南
- 🔧 实验任务与 FPGA 项目
- 📊 练习题与例题集
- 🎯 **V3.0 学渣逆袭手册**（LaTeX 考前突击，CN/EN/CZ 三语）

---

## 📁 目录结构

```
LSP/
├── EXAM/                           # 📝 考试资料
│   ├── 00_Study_Resources_Common/  # 📖 通用学习资料 (CN/EN/CZ + Printable PDFs)
│   ├── 99_LaTeX_Source_Project/    # 🎯 LaTeX 源码项目
│   │   └── LSP_Revision_Master_2026/    # V3.0 学渣逆袭 LaTeX 手册
│   ├── 2015-01-07/                 # 历年真题（按日期分目录）
│   ├── ...
│   ├── 2026-01-13/
│   ├── LSP_Ultimate_Review_Guide_CN.md  # 终极复习指南（CN/EN/CZ + Printable PDF）
│   ├── Study_Index_Complete.md     # 📚 完整索引（强烈推荐从这里开始）
│   └── README.md                   # EXAM 目录说明
│
├── TASK/                           # 🔧 实验任务
│   ├── 1/                          # Task 1
│   ├── 2/task2/                    # Task 2 (Quartus)
│   ├── 3/                          # Task 3
│   └── STUDOCU/                    # Studocu 任务资料
│
├── WEEK1-13/                       # 📖 每周课程笔记
│   ├── WEEK1/  - 入门与控制面板
│   ├── WEEK2/  - 逻辑函数
│   ├── WEEK3/  - VHDL 并发语句
│   ├── WEEK4/  - VHDL 进阶
│   ├── WEEK5/  - LCD 与 process
│   ├── WEEK6/  - CMOS 与仿真
│   ├── WEEK7/  - 存储器与 DFF
│   ├── WEEK8/  - 定点数与亚稳态
│   ├── WEEK9/  - 有限状态机
│   ├── WEEK10/ - 控制单元 FSA
│   ├── WEEK11/ - RISC-V 处理器
│   ├── WEEK12/ - Cache 缓存
│   └── WEEK13/ - 流水线 ALU
│
├── tools/                          # 🛠️ 工具脚本
│   ├── md2pdf.py                   # Markdown 转 PDF
│   └── batch_convert.py            # 批量转换
│
├── BinaryPrerequisite_V20.pdf      # 二进制预备知识
├── LogicCircuitsOnFPGAs.pdf        # FPGA 逻辑电路
└── README.md                       # 本文件
```

---

## 🎯 课程核心内容

### 1️⃣ 数字逻辑基础
- 布尔代数与逻辑门
- 卡诺图化简
- De Morgan 定律
- Shannon 展开

### 2️⃣ 组合逻辑电路
- 多路复用器 / 解复用器
- 编码器 / 解码器
- 加法器设计（全加器、+1 加法器）

### 3️⃣ 时序逻辑电路
- RS 锁存器（NOR/NAND 实现）
- D 触发器、T 触发器
- 寄存器与计数器
- 状态机（Moore/Mealy）

### 4️⃣ VHDL 硬件描述
- 并发语句 vs 顺序语句
- 信号 vs 变量
- 进程与敏感列表
- RTL 视图分析

### 5️⃣ 计算机体系结构
- 处理器流水线（5 级）
- 数据冒险与 Forwarding
- ~~分支预测~~（本次不考）
- ~~Cache 缓存~~（本次不考）

---

## 📝 考试信息（2026 年 1 月）

| 项目 | 说明 |
|------|------|
| 日期 | 2026年1月13日 10:00 |
| 地点 | KN-A-310 |
| 时长 | 90 分钟 |
| 题数 | 8-9 道 |
| 语言 | 捷克语 / 英语 |

### ⭐ 2026 年必考题型（老师确认）
1. 有符号 / 无符号数运算
2. K-Map 等价逻辑函数
3. RS 锁存器波形分析
4. 香农展开
5. 处理器流水线

### ❌ 本次不考
- ~~分支预测器~~
- ~~Cache 计算~~

详见 [EXAM/README_CN.md](EXAM/README_CN.md)

---

## 🔧 实验环境

- **FPGA 开发**: Intel Quartus Prime
- **开发板**: VeekMT2 (Cyclone IV)
- **仿真**: ModelSim / GHDL
- **语言**: VHDL

---

## 📖 推荐复习顺序

1. 📕 从完整索引开始：[EXAM/Study_Index_Complete.md](EXAM/Study_Index_Complete.md)
2. 📘 复习指南（中文）：[EXAM/LSP_Ultimate_Review_Guide_CN.md](EXAM/LSP_Ultimate_Review_Guide_CN.md)
3. 📗 做题：[
EXAM/00_Study_Resources_Common/Legacy_Selected_Examples_Collection.md
](EXAM/00_Study_Resources_Common/Legacy_Selected_Examples_Collection.md)
4. 📙 刷近 3 年真题（2023-2025），重点关注带答案的考试

---

## 🔗 相关链接

- 📌 [CTU FEL 官网](https://fel.cvut.cz)
- 📌 [课程页面](https://cw.fel.cvut.cz/wiki/courses/b0b35lsp)

---

## ⚠️ 免责声明

- 本仓库仅供学习参考
- 答案可能存在错误，以官方为准
- 请遵守学术诚信规范

---

## 📊 更新日志

| 日期 | 更新内容 |
|------|----------|
| 2026.01.15 | README 文档全量三语化（CN/EN/CZ）+ 智能链接修复 |
| 2026.01.13 | 更新索引与近年考试资料（CN/EN/CZ + Printable PDFs） |
| 2025.06 | 添加 2025 年夏季考试 |

---

*祝考试顺利！*
