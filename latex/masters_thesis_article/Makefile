SECDIR = sections
_SECTIONS = introduction.Rnw methods.Rnw experiments.Rnw conclusions.Rnw appendix.Rnw
SECTIONS = $(patsubst %,$(SECDIR)/%,$(_SECTIONS))

DATADIR = data

_DATA = 128_16_std_breqd.csv csp_6195.csv mtus_pya.csv pya_ukp5.csv realistic_random.csv
DATA = $(patsubst %,$(DATADIR)/%,$(_DATA))

all: ejor_ukp_hb_lsb.pdf cover_letter.pdf

ejor_ukp_hb_lsb.pdf: abstract.tex skeleton.Rnw $(SECTIONS) $(DATA) Makefile biblio.bib
	Rscript -e "library(knitr); knit(basename('skeleton.Rnw'))"
	pdflatex skeleton.tex /dev/null
	bibtex skeleton.aux > /dev/null
	pdflatex skeleton.tex > /dev/null
	pdflatex skeleton.tex > /dev/null
	mv skeleton.pdf ejor_ukp_hb_lsb.pdf

cover_letter.pdf: cover_letter.tex
	pdflatex $< /dev/null
	bibtex cover_letter.aux 
	pdflatex $< > /dev/null
	pdflatex $< > /dev/null

clean: Makefile
	rm -rf ejor_ukp_hb_lsb.pdf skeleton.tex *.log *.aux *.toc *.lof *.out *.bbl *.lot *.blg *.spl figure cache

