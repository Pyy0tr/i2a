# i2a

Convert any image with a background into colored ASCII art — ready for [fastfetch](https://github.com/fastfetch-cli/fastfetch) or direct terminal display.

## Pipeline

```
image (png/jpg/webp/...) → magick (background removal) → jp2a (ASCII art) → stdout or file
```

## Dependencies

- [imagemagick](https://imagemagick.org/) — `pacman -S imagemagick`
- [jp2a](https://github.com/cslarsen/jp2a) — `pacman -S jp2a`

## Installation

```bash
git clone https://github.com/YOUR_USERNAME/i2a.git
cd i2a
sudo make install
```

## Usage

```bash
# Preview in terminal
i2a logo.png --preview=true

# Save to file
i2a logo.png --output=~/.config/fastfetch/logo.txt

# Save and preview
i2a logo.png --output=logo.txt --preview=true

# Custom width and color mode
i2a logo.webp --width=40 --color-mode=24bit --output=logo.txt

# Manual background color + fuzz
i2a logo.jpg --bg-color=#ffffff --fuzz=15 --output=logo.txt
```

## Options

| Option | Default | Description |
|---|---|---|
| `--output=FILE` | — | Save ASCII art to file |
| `--preview=true` | false | Print ASCII art in terminal |
| `--width=N` | jp2a default | Width in columns |
| `--height=N` | jp2a default | Height in lines |
| `--color-mode=24bit\|8bit\|bw` | 24bit | Color mode |
| `--bg-color=auto\|#rrggbb\|white\|black` | auto | Background color to remove |
| `--fuzz=N` | 5 | Background removal tolerance (%) |

## Use with fastfetch

```bash
i2a logo.png --width=40 --output=~/.config/fastfetch/logo.txt
```

Then in your fastfetch config:
```json
"logo": {
  "source": "~/.config/fastfetch/logo.txt",
  "type": "file"
}
```

## License

MIT
