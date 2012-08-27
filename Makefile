PUBGEN := _pubgen
RMFILES_REL := Makefile pubs/cota.bib
RMFILES := $(addprefix _site/, $(RMFILES_REL))

all: build

build: preprocess
	jekyll
	rm $(RMFILES)

test: build
	jekyll --server 4323

preprocess:
	$(MAKE) -C $(PUBGEN) deliver

deliver: build
	scp -r _site/* cota@clic.cs.columbia.edu:~/html/

clean:
	$(MAKE) -C $(PUBGEN) clean
.PHONY: all build test
