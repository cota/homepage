PUBGEN := _pubgen
CANDIDACY := _candidacy
HOSTNAME := cota@compute.cs.columbia.edu

all: build

build: pubs.rss
	jekyll build
	$(PUBGEN)/postprocess.pl _site/index.html > _site/index.html.tmp
	mv _site/index.html.tmp _site/index.html
	$(RM) -r _site/pubs/*-slides

pubs.rss: pubs/cota.bib
	$(PUBGEN)/rss.pl $< > $@

test: build
	jekyll --server 4323

deliver: build
	./deliver.sh $(HOSTNAME)

clean:
	$(RM) -r _site *.rss
.PHONY: all build test
