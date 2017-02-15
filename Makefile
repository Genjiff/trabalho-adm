# aptitude install abntex texlive-latex-extra

SOURCEDOCUMENT=meu-possante
PDFVIEWER=evince
CAPITULOS=$(wildcard *.tex)

#######################################

all: $(SOURCEDOCUMENT).pdf

view: $(SOURCEDOCUMENT).pdf
	$(PDFVIEWER) $(SOURCEDOCUMENT).pdf &

$(SOURCEDOCUMENT).pdf: $(SOURCEDOCUMENT).tex $(CAPITULOS) $(SOURCEDOCUMENT).bib
	pdflatex $< && \
	bibtex $(SOURCEDOCUMENT) && \
	pdflatex $< && \
	pdflatex $< || \
	$(RM) $@

clean:
	$(RM) *.aux *.bbl *.blg *.lof *.lot *.log $(SOURCEDOCUMENT).pdf *~ \
	*.toc *.ilg *.sigla *.siglax *.symbols *.symbolsx
