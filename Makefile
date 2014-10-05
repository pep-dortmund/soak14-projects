TEXOPTIONS = --interaction=nonstopmode --output-directory=build --halt-on-error

PROJECTS = 3D Arduino Astro Nebelkammer Wasserrakete
FILES = $(addprefix SoAk2014_Projekt_, $(PROJECTS))

DOCS =  $(addprefix build/, $(addsuffix .pdf, $(FILES)))

all: $(DOCS)


$(DOCS): $(addsuffix .tex, $(FILES)) | build
	lualatex $(TEXOPTIONS) $(subst .pdf,, $(subst build/,,$@))
	lualatex $(TEXOPTIONS) $(subst .pdf,, $(subst build/,,$@))

build:
	mkdir -p build

clean:
	rm -rf build
