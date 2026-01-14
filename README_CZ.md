> 🌍 **Language**: [🇨🇳 中文](./README_CN.md) | [🇬🇧 English](./README_EN.md) | [🇨🇿 Čeština](./README_CZ.md)

# 🎓 LSP - Logické systémy a procesory

> **Kurz**: LSP (Logické systémy a procesory) — Logic Systems and Processors  
> **Škola**: CTU FEL Praha  
> **Aktualizace**: 2026-01-15

---

## 📚 Přehled

Tento repozitář obsahuje kompletní studijní materiály pro kurz LSP na CTU FEL, včetně:
- 📝 Starších zkoušek a řešení (2015–2026)
- 📖 Poznámek a přehledových materiálů
- 🔧 Úloh do laboratoře a FPGA projektů
- 📊 Příkladů a cvičných úloh
- 🎯 **V3.0 Exam Cram manuál** (LaTeX, tři jazyky CN/EN/CZ)

---

## 📁 Struktura repozitáře

```
LSP/
├── EXAM/                           # 📝 Zkoušky a materiály
│   ├── 00_Study_Resources_Common/  # 📖 Sdílené zdroje (CN/EN/CZ + Printable PDF)
│   ├── 99_LaTeX_Source_Project/    # 🎯 LaTeX zdrojový projekt
│   │   └── LSP_Revision_Master_2026/    # V3.0 LaTeX „exam cram“ manuál
│   ├── 2015-01-07/                 # Starší zkoušky (složky dle data)
│   ├── ...
│   ├── 2026-01-13/
│   ├── LSP_Ultimate_Review_Guide_CZ.md  # Ultimátní přehled (CN/EN/CZ + Printable PDF)
│   ├── Study_Index_Complete.md     # 📚 Hlavní index (začni zde)
│   └── README.md                   # Index složky EXAM
│
├── TASK/                           # 🔧 Laboratorní úlohy
│   ├── 1/
│   ├── 2/task2/
│   ├── 3/
│   └── STUDOCU/
│
├── WEEK1-13/                       # 📖 Týdenní poznámky
│   ├── WEEK1/  - Úvod
│   ├── WEEK2/  - Logické funkce
│   ├── WEEK3/  - VHDL souběžnost
│   ├── WEEK4/  - VHDL pokročilé
│   ├── WEEK5/  - LCD + process
│   ├── WEEK6/  - CMOS + simulace
│   ├── WEEK7/  - Paměti + DFF
│   ├── WEEK8/  - Pevná řádová čárka + metastabilita
│   ├── WEEK9/  - Stavové automaty
│   ├── WEEK10/ - Řídicí jednotka FSA
│   ├── WEEK11/ - RISC-V
│   ├── WEEK12/ - Cache
│   └── WEEK13/ - Pipeline ALU
│
├── tools/                          # 🛠️ Nástroje
│   ├── md2pdf.py
│   └── batch_convert.py
│
├── BinaryPrerequisite_V20.pdf
├── LogicCircuitsOnFPGAs.pdf
└── README.md
```

---

## 🎯 Hlavní témata

### 1️⃣ Základy digitální logiky
- Booleova algebra a logické hradla
- Karnaughovy mapy (K-Map)
- De Morganovy zákony
- Shannonova expanze

### 2️⃣ Kombinační obvody
- Multiplexory / demultiplexory
- Kodéry / dekodéry
- Návrh sčítaček (full adder, +1 adder)

### 3️⃣ Sekvenční obvody
- RS latch (NOR/NAND)
- D / T klopné obvody
- Registry a čítače
- Stavové automaty (Moore/Mealy)

### 4️⃣ VHDL
- Souběžné vs sekvenční příkazy
- Signály vs proměnné
- Process a sensitivity list
- RTL kontrola

### 5️⃣ Architektura procesorů
- 5stupňová pipeline
- Datové hazardy a forwarding
- ~~Predikce skoku~~ (tentokrát se netestuje)
- ~~Cache~~ (tentokrát se netestuje)

---

## 📝 Informace ke zkoušce (leden 2026)

| Položka | Detaily |
|--------|---------|
| Datum | 2026-01-13 10:00 |
| Místnost | KN-A-310 |
| Délka | 90 minut |
| Počet úloh | 8–9 |
| Jazyk | čeština / angličtina |

### ⭐ Co bude (potvrzeno vyučujícím)
1. Operace se znaménkem / bez znaménka
2. Ekvivalence funkcí přes K-Map
3. Analýza průběhů RS latch
4. Shannonova expanze
5. Pipeline procesoru

### ❌ Co nebude
- ~~Prediktor skoku~~
- ~~Cache výpočty~~

Viz [EXAM/README_CZ.md](EXAM/README_CZ.md)

---

## 🔧 Prostředí pro úlohy

- **FPGA**: Intel Quartus Prime
- **Deska**: VeekMT2 (Cyclone IV)
- **Simulace**: ModelSim / GHDL
- **Jazyk**: VHDL

---

## 📖 Doporučený postup učení

1. 📕 Začni hlavním indexem: [EXAM/Study_Index_Complete.md](EXAM/Study_Index_Complete.md)
2. 📘 Přehledový průvodce (CZ): [EXAM/LSP_Ultimate_Review_Guide_CZ.md](EXAM/LSP_Ultimate_Review_Guide_CZ.md)
3. 📗 Procvičování: [EXAM/00_Study_Resources_Common/Legacy_Selected_Examples_Collection.md](EXAM/00_Study_Resources_Common/Legacy_Selected_Examples_Collection.md)
4. 📙 Projdi poslední 3 roky (2023–2025), hlavně s řešeními

---

## 🔗 Odkazy

- 📌 [CTU FEL](https://fel.cvut.cz)
- 📌 [Stránka kurzu](https://cw.fel.cvut.cz/wiki/courses/b0b35lsp)

---

## ⚠️ Upozornění

- Pouze pro studijní účely
- Řešení mohou obsahovat chyby; rozhoduje oficiální zadání
- Dodržuj akademickou integritu

---

## 📊 Změny

| Datum | Změna |
|------|-------|
| 2026-01-15 | Globální tri-jazyčné README (CN/EN/CZ) + „smart links“ |
| 2026-01-13 | Aktualizace indexu a posledních zkoušek (CN/EN/CZ + Printable PDF) |
| 2025-06 | Přidány letní zkoušky 2025 |

---

*Hodně štěstí u zkoušky!*
