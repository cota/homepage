HEAD = head_pub.md
TAIL = tail_pub.md

KEYWORD  = candidacy.html

PUBS := ../pubs

BIB_FILE = list.bib
SITE_FOLDER=../

PUBDOMO = pubdomo --html --styles=styles --pubs=$(PUBS) --nodowncase --asc \
	--keywords="Motivation,Memory Controller,Non-Uniform Cache Architectures (NUCA),Multicore Scalability,Heterogeneous Architectures"

OBJS = $(KEYWORD)

all: $(OBJS)

keyword.yaml: $(BIB_FILE)
	$(PUBDOMO) --sort=keyword $< > $@

$(KEYWORD): keyword.yaml
	cat $(HEAD) $< $(TAIL) > $@

deliver: all
	cp $(OBJS) $(SITE_FOLDER)

clean:
	rm -f $(OBJS) *.yaml *.tmp

.PHONY: $(OBJS)
