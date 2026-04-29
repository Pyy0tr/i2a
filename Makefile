PREFIX ?= /usr/local
BINDIR  = $(PREFIX)/bin

install:
	install -Dm755 i2a $(DESTDIR)$(BINDIR)/i2a

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/i2a

.PHONY: install uninstall
