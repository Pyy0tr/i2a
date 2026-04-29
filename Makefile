PREFIX ?= /usr/local
BINDIR  = $(PREFIX)/bin

install: install-deps
	install -Dm755 img2term $(DESTDIR)$(BINDIR)/img2term

install-deps:
	@if command -v pacman >/dev/null 2>&1; then \
		sudo pacman -S --needed imagemagick jp2a chafa; \
	elif command -v apt >/dev/null 2>&1; then \
		sudo apt install -y imagemagick jp2a chafa; \
	elif command -v dnf >/dev/null 2>&1; then \
		sudo dnf install -y imagemagick jp2a chafa; \
	elif command -v brew >/dev/null 2>&1; then \
		brew install imagemagick jp2a chafa; \
	else \
		echo "Package manager not supported. Install manually: imagemagick jp2a chafa"; exit 1; \
	fi

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/img2term

.PHONY: install install-deps uninstall
