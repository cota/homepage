PUBGEN := _pubgen
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

deliver: build
	ssh $(HOSTNAME) "rm -rf ~/html/*"
	scp -r _site/* $(HOSTNAME):~/html/

clean:
	$(MAKE) -C $(PUBGEN) clean
.PHONY: all build test
