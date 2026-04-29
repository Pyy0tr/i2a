# img2term

Convert any image with a background into terminal art — ASCII or pixel (Unicode blocks), ready for [fastfetch](https://github.com/fastfetch-cli/fastfetch) or direct terminal display.

## Pipeline

```
image (png/jpg/webp/...) → magick (background removal) → jp2a or chafa → .txt (ANSI) or stdout
```

## Dependencies

- [imagemagick](https://imagemagick.org/) — `pacman -S imagemagick`
- [jp2a](https://github.com/cslarsen/jp2a) — `pacman -S jp2a` *(--renderer=ascii)*
- [chafa](https://hpjansson.org/chafa/) — `pacman -S chafa` *(--renderer=pixel)*

## Installation

```bash
git clone https://github.com/Pyy0tr/img2term.git
cd img2term
sudo make install
```

Dependencies are installed automatically.

## Usage

```bash
# Save ASCII art to file
img2term logo.png --output=~/.config/fastfetch/logo.txt

# Preview in terminal
img2term logo.png --preview=true

# Save and preview
img2term logo.png --output=logo.txt --preview=true

# Pixel art renderer (Unicode blocks via chafa)
img2term logo.png --renderer=pixel --width=40 --output=logo.txt

# Custom width and color mode
img2term logo.webp --width=40 --color-mode=24bit --output=logo.txt

# Manual background color + fuzz
img2term logo.jpg --bg-color=#ffffff --fuzz=15 --output=logo.txt
```

## Options

| Option | Default | Description |
|---|---|---|
| `--output=FILE` | — | Save to .txt file (ANSI escape codes) |
| `--preview=true` | false | Print in terminal |
| `--width=N\|auto` | auto | Width in columns (auto = terminal width) |
| `--height=N\|auto` | — | Height in lines (auto = terminal height) |
| `--color-mode=24bit\|8bit\|bw` | 24bit | Color mode |
| `--bg-color=auto\|#rrggbb\|white\|black` | auto | Background color to remove |
| `--fuzz=N` | 10 | Background removal tolerance (%) |
| `--prop=true\|false` | true | Keep aspect ratio when only width or height is set |
| `--renderer=ascii\|pixel` | ascii | ascii: jp2a — pixel: chafa (Unicode blocks) |

## Use with fastfetch

```bash
img2term logo.png --width=40 --output=~/.config/fastfetch/logo.txt
```

Then in your fastfetch config:
```json
"logo": {
  "source": "~/.config/fastfetch/logo.txt",
  "type": "file"
}
```

Both `--renderer=ascii` and `--renderer=pixel` produce `.txt` files with ANSI escape codes, fully supported by fastfetch.

## License

MIT
