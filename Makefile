TEXOPTIONS = --interaction=batchmode \
			 --output-directory=build \
			 --halt-on-error

PROJECTS = 3D Arduino Astro Nebelkammer Wasserrakete\
		   Solarkocher Solarofen microblog

FILES = $(addprefix SoAk2014_Projekt_, $(PROJECTS))
DOCS =  $(addprefix build/, $(addsuffix .pdf, $(FILES)))



all: $(DOCS) build/SoAk2014_Zusammenfassung_small.pdf

build/%.pdf: %.tex | build
	lualatex $(TEXOPTIONS) $^ && echo
	lualatex $(TEXOPTIONS) $^ && echo

build/SoAk2014_Zusammenfassung_small.pdf: build/SoAk2014_Zusammenfassung.pdf
	gs \
	-o build/SoAk2014_Zusammenfassung_small.pdf \
	-sDEVICE=pdfwrite \
	-dJPEGQ=90 \
	-dDownsampleColorImages=true \
	-dDownsampleGrayImages=true \
	-dDownsampleMonoImages=true \
	-dColorImageResolution=300 \
	-dGrayImageResolution=300 \
	-dMonoImageResolution=300 \
	-dColorImageDownsampleThreshold=1.0 \
	-dGrayImageDownsampleThreshold=1.0 \
	-dMonoImageDownsampleThreshold=1.0 \
	build/SoAk2014_Zusammenfassung.pdf



build:
	mkdir -p build

clean:
	rm -rf build

summary: 
	lualatex $(TEXOPTIONS) SoAk2014_Zusammenfassung.tex
	lualatex $(TEXOPTIONS) SoAk2014_Zusammenfassung.tex
