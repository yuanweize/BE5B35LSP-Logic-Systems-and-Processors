.PHONY: all cn en cz clean

TEX_DEPS = chapters/*.tex lsp-exam.cls references.bib

LATEXMK := $(shell command -v latexmk 2>/dev/null)
XELATEX := $(shell command -v xelatex 2>/dev/null)

all: cn en cz

define BUILD
	@if [ -n "$(LATEXMK)" ]; then \
		latexmk -xelatex -jobname=$(1) $(2); \
	else \
		if [ -z "$(XELATEX)" ]; then \
			echo "ERROR: neither 'latexmk' nor 'xelatex' is available in PATH."; \
			exit 1; \
		fi; \
		xelatex -interaction=nonstopmode -shell-escape -jobname=$(1) $(2); \
		xelatex -interaction=nonstopmode -shell-escape -jobname=$(1) $(2); \
	fi
endef

cn: main_CN.tex $(TEX_DEPS)
	$(call BUILD,LSP_Revision_Master_2026_CN,main_CN.tex)

en: main_EN.tex $(TEX_DEPS)
	$(call BUILD,LSP_Revision_Master_2026_EN,main_EN.tex)

cz: main_CZ.tex $(TEX_DEPS)
	$(call BUILD,LSP_Revision_Master_2026_CZ,main_CZ.tex)

clean:
	@if [ -n "$(LATEXMK)" ]; then \
		latexmk -c -jobname=LSP_Revision_Master_2026_CN main_CN.tex || true; \
		latexmk -c -jobname=LSP_Revision_Master_2026_EN main_EN.tex || true; \
		latexmk -c -jobname=LSP_Revision_Master_2026_CZ main_CZ.tex || true; \
	else \
		rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.fls *.fdb_latexmk *.xdv *.synctex.gz; \
		rm -f chapters/*.aux; \
	fi
	rm -f *.run.xml *.bbl
