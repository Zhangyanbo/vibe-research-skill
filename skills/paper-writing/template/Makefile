.PHONY: en zh all clean

all: en zh

en: main.pdf

zh: main.zh.pdf

main.pdf: main.tex sections/*.tex ref.bib
	pdflatex -synctex=1 -interaction=nonstopmode main.tex
	bibtex main
	pdflatex -synctex=1 -interaction=nonstopmode main.tex
	pdflatex -synctex=1 -interaction=nonstopmode main.tex

main.zh.pdf: main.zh.tex sections_zh/*.tex ref.bib
	xelatex -synctex=1 -interaction=nonstopmode main.zh.tex
	bibtex main.zh
	xelatex -synctex=1 -interaction=nonstopmode main.zh.tex
	xelatex -synctex=1 -interaction=nonstopmode main.zh.tex

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.fdb_latexmk *.fls *.synctex.gz
