PUBGEN := _pubgen
CANDIDACY := _candidacy
RMFILES_REL := Makefile pubs/cota.bib README.md pubs/candidacy.odp
RMFILES := $(addprefix _site/, $(RMFILES_REL))
HOSTNAME := cota@clic.cs.columbia.edu

all: build

build: preprocess
	jekyll build
	rm $(RMFILES)

test: build
	jekyll --server 4323 serve

preprocess:
	$(MAKE) -C $(PUBGEN) deliver
	$(MAKE) -C $(CANDIDACY) deliver

deliver: build
	./deliver.sh $(HOSTNAME)

clean:
	$(MAKE) -C $(PUBGEN) clean
	$(MAKE) -C $(CANDIDACY) clean
.PHONY: all build test
