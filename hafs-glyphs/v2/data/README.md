# v2 data

`mushaf.txt` — one line per ayah, format: `<page_number>,<glyph_codepoints>`.

- 6,236 lines (full mushaf, Hafs reading).
- Codepoints in the PUA range U+FC41–U+FD79.
- **Codepoints repeat across pages.** The same U+FCxx codepoint renders a different word in each page's font — so you MUST pair a line's glyphs with the matching page's font.
- This repo contains fonts for pages 1–100 only (`QCF2001.ttf` … `QCF2100.ttf`). Pages 101–604 can't be rendered from this repo without additional fonts.

Pairing rule: take line `<page>,<glyphs>` → set `font-family: 'QCF2{page:03d}'` (so `QCF2042` for page 42).

See [`../../README.md`](../../README.md) for the overall architecture.
