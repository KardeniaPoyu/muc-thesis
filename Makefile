.PHONY: main clean help

main:
	xelatex -interaction=nonstopmode main.tex
	biber main
	xelatex -interaction=nonstopmode main.tex
	xelatex -interaction=nonstopmode main.tex

clean:
	rm -f *.aux *.bbl *.bcf *.blg *.log *.out *.pdf *.run.xml *.toc

help:
	@echo "Usage:"
	@echo "  make main    - Compile the thesis"
	@echo "  make clean   - Remove build artifacts"
	@echo "  make help    - Show this help message"
