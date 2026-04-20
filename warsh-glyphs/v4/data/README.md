# v4 Warsh glyph mapping data

`quran.json` — word-by-word PUA mapping for the v4 Warsh page-glyph fonts.

Same format as [`hafs-glyphs/v4/data/README.md`](../../../hafs-glyphs/v4/data/README.md): a 114-surah array of verses of words `{p, c}`, where `p` selects `QCF4_Warsh_{p:02d}_W.ttf` and `c` is the PUA codepoint to render with that font.

## Example — Ayat al-Kursi (2:255)

25 words, all in `QCF4_Warsh_04_W`. Codepoints start at U+F330.

## Source

Imported from [NaifAlsultan/typst-quran-package](https://github.com/NaifAlsultan/typst-quran-package) (`src/warsh.json`).
