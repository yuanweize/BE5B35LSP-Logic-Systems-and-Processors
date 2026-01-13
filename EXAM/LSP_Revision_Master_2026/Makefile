# LSP 考试终极复习资料 - Makefile
# 作者: AI助教
# 日期: 2026年1月13日

# 主文件名（不含扩展名）
MAIN = main

# LaTeX 编译器
LATEX = xelatex
BIBTEX = bibtex

# 编译选项
LATEX_FLAGS = -interaction=nonstopmode -shell-escape

# 默认目标
all: $(MAIN).pdf

# 完整编译流程 (xelatex -> bibtex -> xelatex x2)
$(MAIN).pdf: $(MAIN).tex chapters/*.tex lsp-exam.cls references.bib
	@echo "====== 第1次编译 ======"
	-$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	@echo "====== 处理参考文献 ======"
	-$(BIBTEX) $(MAIN)
	@echo "====== 第2次编译 ======"
	-$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	@echo "====== 第3次编译（最终） ======"
	-$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	@echo "====== 编译完成! ======"
	@echo "输出文件: $(MAIN).pdf"

# 快速编译（仅一次，用于调试）
quick:
	-$(LATEX) $(LATEX_FLAGS) $(MAIN).tex

# 清理辅助文件
clean:
	rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.fls *.fdb_latexmk
	rm -f chapters/*.aux
	@echo "辅助文件已清理"

# 深度清理（包括PDF）
distclean: clean
	rm -f $(MAIN).pdf
	@echo "所有生成文件已清理"

# 打开PDF（macOS）
view: $(MAIN).pdf
	open $(MAIN).pdf

# 持续编译（需要 latexmk）
watch:
	latexmk -xelatex -pvc -interaction=nonstopmode $(MAIN).tex

# 帮助信息
help:
	@echo "LSP 复习资料编译系统"
	@echo "===================="
	@echo "make        - 完整编译（推荐）"
	@echo "make quick  - 快速编译（调试用）"
	@echo "make clean  - 清理辅助文件"
	@echo "make distclean - 清理所有生成文件"
	@echo "make view   - 打开PDF查看"
	@echo "make watch  - 持续监听编译"

.PHONY: all quick clean distclean view watch help
