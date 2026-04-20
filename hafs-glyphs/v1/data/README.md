# v1 data

`mushaf.txt` — one line per ayah, format: `<page_number>,<glyph_codepoints>`.

- 6,235 lines (full mushaf, Hafs reading).
- Codepoints in the PUA range U+FB50–U+FC79.
- Each page's glyphs render with that page's font, e.g. page 42 uses `../fonts/QCF_P042.ttf`.
- The `QCF_BSML.ttf` basmalah font is separate — not indexed by this file.

Pairing rule: take any line `<page>,<glyphs>` → set `font-family: 'QCF_P{page:03d}'` on an element containing those glyphs.

Same codepoint scheme is used by v1.5 (different per-page font files, same glyphs). See [`../../README.md`](../../README.md) for the overall architecture.
