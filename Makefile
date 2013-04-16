PUBGEN := _pubgen
CANDIDACY := _candidacy
RMFILES_REL := Makefile pubs/cota.bib README.md
RMFILES := $(addprefix _site/, $(RMFILES_REL))
HOSTNAME := cota@clic.cs.columbia.edu

all: build

build: preprocess
	jekyll
	rm $(RMFILES)

test: build
	jekyll --server 4323

preprocess:
	$(MAKE) -C $(PUBGEN) deliver
	$(MAKE) -C $(CANDIDACY) deliver

deliver: build
	scp -r _site/* $(HOSTNAME):~/html/

clean:
	$(MAKE) -C $(PUBGEN) clean
	$(MAKE) -C $(CANDIDACY) clean
.PHONY: all build test
