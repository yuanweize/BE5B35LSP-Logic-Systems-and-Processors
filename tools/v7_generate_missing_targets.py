from __future__ import annotations

from pathlib import Path
import re

REPO_ROOT = Path(__file__).resolve().parents[1]
EXAM_ROOT = REPO_ROOT / "EXAM"


def _read(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def _write(path: Path, content: str) -> None:
    path.write_text(content, encoding="utf-8")


_Q_HEADING_CN = re.compile(r"^(## )Q(\d+)\b", re.M)
_Q_HEADING_CZ = re.compile(r"^(## )Q(\d+)\b", re.M)
_Q_HEADING_CN2 = re.compile(r"^(## )第(\d+)题\b", re.M)


def _transform_structured(
    cn_text: str,
    *,
    title: str,
    lang: str,
) -> str:
    lines = cn_text.splitlines()
    if lines:
        lines[0] = title
    text = "\n".join(lines)

    if lang == "EN":
        text = re.sub(r"^(## )第(\d+)题\s*-\s*", lambda m: f"{m.group(1)}Q{m.group(2)} - ", text, flags=re.M)
        text = re.sub(r"^(## )第(\d+)题\b", lambda m: f"{m.group(1)}Q{m.group(2)}", text, flags=re.M)
        repl = [
            ("## 考试信息", "## Exam Information"),
            ("- 日期：", "- Date: "),
            ("- 语言：", "- Language: "),
            ("- 总分：", "- Total: "),
            ("- 包含官方答案", "- Official answers included"),
            ("**题目：**", "**Problem:**"),
            ("**输入序列：**", "**Input sequence:**"),
            ("**计算：**", "**Calculation:**"),
            ("**官方答案：**", "**Official answer:**"),
            ("**✅ 官方答案：**", "**✅ Official answer:**"),
            ("> ✅ **官方参考答案", "> ✅ **Official answer"),
            ("> ✅ **本文件已核对PDF官方答案 (Official Answers Verified from PDF)**", "> ✅ **Verified against official PDF answers**"),
            ("> 🛑 **非考点提示 (Not on Exam):**", "> 🛑 **Not on exam:**"),
            ("> 💡 **补充解析：**", "> 💡 **Additional notes:**"),
            ("> 💡 **补充解析 (", "> 💡 **Additional notes ("),
            ("## 知识点总结", "## Key Takeaways"),
            ("### ✅ 重要答案速记", "### ✅ Quick Answers"),
            ("### ⭐ 必背公式", "### ⭐ Must-Know Formulas"),
        ]
    elif lang == "CZ":
        text = re.sub(r"^(## )第(\d+)题\s*-\s*", lambda m: f"{m.group(1)}Úloha {m.group(2)} - ", text, flags=re.M)
        text = re.sub(r"^(## )第(\d+)题\b", lambda m: f"{m.group(1)}Úloha {m.group(2)}", text, flags=re.M)
        repl = [
            ("## 考试信息", "## Informace o zkoušce"),
            ("- 日期：", "- Datum: "),
            ("- 语言：", "- Jazyk: "),
            ("- 总分：", "- Celkem: "),
            ("- 包含官方答案", "- Obsahuje oficiální odpovědi"),
            ("**题目：**", "**Zadání:**"),
            ("**输入序列：**", "**Vstupní sekvence:**"),
            ("**计算：**", "**Výpočet:**"),
            ("**官方答案：**", "**Oficiální odpověď:**"),
            ("**✅ 官方答案：**", "**✅ Oficiální odpověď:**"),
            ("> ✅ **官方参考答案", "> ✅ **Oficiální odpověď"),
            ("> ✅ **本文件已核对PDF官方答案 (Official Answers Verified from PDF)**", "> ✅ **Ověřeno podle oficiálních odpovědí v PDF**"),
            ("> 🛑 **非考点提示 (Not on Exam):**", "> 🛑 **Mimo rozsah zkoušky:**"),
            ("> 💡 **补充解析：**", "> 💡 **Doplňující poznámky:**"),
            ("> 💡 **补充解析 (", "> 💡 **Doplňující poznámky ("),
            ("## 知识点总结", "## Shrnutí"),
            ("### ✅ 重要答案速记", "### ✅ Rychlé odpovědi"),
            ("### ⭐ 必背公式", "### ⭐ Nutné vzorce"),
        ]
    else:
        raise ValueError(f"Unsupported lang: {lang}")

    for a, b in repl:
        text = text.replace(a, b)

    return text + ("\n" if not text.endswith("\n") else "")


def generate_answers_2024_2025() -> None:
    targets = [
        (
            "2024-06-05",
            "2024-06-05_Exam_Answers",
            "# LSP Exam — June 5, 2024 (Official Answers Included)",
            "# LSP zkouška — 5. června 2024 (včetně oficiálních odpovědí)",
        ),
        (
            "2024-06-14",
            "2024-06-14_Exam_Answers",
            "# LSP Exam — June 14, 2024 (Official Answers Included)",
            "# LSP zkouška — 14. června 2024 (včetně oficiálních odpovědí)",
        ),
        (
            "2025-01-20",
            "2025-01-20_Exam_Answers",
            "# LSP Exam — January 20, 2025 (Official Answers Included)",
            "# LSP zkouška — 20. ledna 2025 (včetně oficiálních odpovědí)",
        ),
    ]

    for folder, base, title_en, title_cz in targets:
        p = EXAM_ROOT / folder
        cn_path = p / f"{base}_CN.md"
        en_path = p / f"{base}_EN.md"
        cz_path = p / f"{base}_CZ.md"

        cn_text = _read(cn_path)
        _write(en_path, _transform_structured(cn_text, title=title_en, lang="EN"))
        _write(cz_path, _transform_structured(cn_text, title=title_cz, lang="CZ"))


def _extract_v4_header(en_text: str) -> str:
    lines = en_text.splitlines()
    # Expect: title, blank, '>' header line, '>', nav line, blank
    # We'll extract the first blockquote section up to the blank line after nav.
    out: list[str] = []
    in_block = False
    for i, line in enumerate(lines[1:], start=2):
        if line.startswith("> ") or line == ">":
            in_block = True
            out.append(line)
            continue
        if in_block:
            break
    return "\n".join(out).strip() + "\n"


def generate_2026_cn_cz() -> None:
    folder = EXAM_ROOT / "2026-01-13"
    en_path = folder / "2026-01-13_Exam_Results_EN.md"
    cn_path = folder / "2026-01-13_Exam_Results_CN.md"
    cz_path = folder / "2026-01-13_Exam_Results_CZ.md"

    en_text = _read(en_path)
    header = _extract_v4_header(en_text)

    def render(base_title: str, lang: str) -> str:
        body_lines = en_text.splitlines()[1:]
        # Drop the existing header block (blockquotes right after title) to avoid duplication.
        while body_lines and (body_lines[0].strip() == "" or body_lines[0].startswith(">")):
            body_lines.pop(0)
        body = "\n".join(body_lines)

        if lang == "CN":
            body = _Q_HEADING_CN.sub(lambda m: f"{m.group(1)}第{m.group(2)}题", body)
            body = body.replace("## Results (Official) + Detailed Solutions", "## 官方结果（原始）+ 详细解析")
            body = body.replace("### Official answer", "### 官方答案")
            body = body.replace("### Explanation", "### 解析")
            body = body.replace("### Explanation (", "### 解析 (")
            body = body.replace("## Appendix", "## 附录")
            body = body.replace("Notes:", "说明：")
            body = body.replace("Verified equivalence", "已验证等价性")
            body = body.replace("Truth tables", "真值表")
        elif lang == "CZ":
            body = _Q_HEADING_CZ.sub(lambda m: f"{m.group(1)}Úloha {m.group(2)}", body)
            body = body.replace("## Results (Official) + Detailed Solutions", "## Oficiální výsledky + detailní řešení")
            body = body.replace("### Official answer", "### Oficiální odpověď")
            body = body.replace("### Explanation", "### Vysvětlení")
            body = body.replace("### Explanation (", "### Vysvětlení (")
            body = body.replace("## Appendix", "## Příloha")
            body = body.replace("Notes:", "Poznámky:")
            body = body.replace("Verified equivalence", "Ověřená ekvivalence")
            body = body.replace("Truth tables", "Pravdivostní tabulky")
        else:
            raise ValueError(lang)

        return f"{base_title}\n\n{header}\n{body.strip()}\n"

    _write(cn_path, render("# LSP考试结果与解析 — 2026年1月13日", "CN"))
    _write(cz_path, render("# Výsledky a řešení zkoušky LSP — 13. ledna 2026", "CZ"))


def main() -> None:
    generate_answers_2024_2025()
    generate_2026_cn_cz()


if __name__ == "__main__":
    main()
