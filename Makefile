TEXOPTIONS = --interaction=batchmode \
			 --output-directory=build \
			 --halt-on-error

PROJECTS = 3D Arduino Astro Nebelkammer Wasserrakete\
		   Solarkocher Solarofen microblog

FILES = $(addprefix SoAk2014_Projekt_, $(PROJECTS))
DOCS =  $(addprefix build/, $(addsuffix .pdf, $(FILES)))



all: $(DOCS) build/SoAk2014_Zusammenfassung.pdf

build/%.pdf: %.tex | build
	lualatex $(TEXOPTIONS) $^ && echo
	lualatex $(TEXOPTIONS) $^ && echo

build:
	mkdir -p build

clean:
	rm -rf build

summary: 
	lualatex $(TEXOPTIONS) SoAk2014_Zusammenfassung.tex
	lualatex $(TEXOPTIONS) SoAk2014_Zusammenfassung.tex
