#!/usr/bin/make -f

#SUBDIRS :=
 
all: install

install:
	mkdir -pv $(DESTDIR)
	cp -a src/usr $(DESTDIR)/.
	cp -a src/etc $(DESTDIR)/.
	# po generation
	for i in $(SUBDIRS); do \
		make -C $(DESTDIR)/$$i; \
		rm -rf $(DESTDIR)/$$i; \
	done
	# remove some remaining files
	find $(DESTDIR) -type f -iname "*.in" | xargs rm -f

# vim:ts=4
