HEAD = head_pub.md
TAIL = tail_pub.md

YEAR  = index.html

PUBS := ../pubs
BIBS := ../bibs

BIB_FILE = $(PUBS)/cota.bib
SITE_FOLDER=../

PUBDOMO = pubdomo --html --styles=styles --pubs=$(PUBS) --bibs=$(BIBS)

RSS := pubs.rss
RSS_SCRIPT := ./rss.rb

OBJS = $(YEAR) $(RSS)

all: $(OBJS)

year.yaml: $(BIB_FILE)
	$(PUBDOMO) --splitbib --sort=year $< > $@
$(YEAR): year.yaml
	cat $(HEAD) $< $(TAIL) > $@.tmp
	./urls.pl $@.tmp > $@

$(RSS): year.yaml
	cat $< | $(RSS_SCRIPT) > $@

deliver: all
	cp $(OBJS) $(SITE_FOLDER)

clean:
	rm -f $(OBJS) *.yaml *.tmp

.PHONY: $(OBJS)
