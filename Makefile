TEXOPTIONS = --interaction=nonstopmode --output-directory=build --halt-on-error

PROJECTS = 3D Arduino Astro Nebelkammer Wasserrakete Solarkocher\
		   Solarofen

FILES = $(addprefix SoAk2014_Projekt_, $(PROJECTS))
DOCS =  $(addprefix build/, $(addsuffix .pdf, $(FILES)))

all: $(DOCS)


build/%.pdf: %.tex | build
	lualatex $(TEXOPTIONS) $^

build:
	mkdir -p build

clean:
	rm -rf build
