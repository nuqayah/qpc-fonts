# v4 Hafs glyph mapping data

`quran.json` — word-by-word PUA mapping for the v4 Hafs page-glyph fonts.

## Format

```json
[ // 114 surahs
  [ // verses (e.g. surah 1 has 7)
    [ // words in verse
      {"p": 4, "c": 61778}, // p = font number → QCF4_Hafs_04_W; c = PUA codepoint
      ...
    ]
  ]
]
```

To render verse `(s, v)`:
1. Look up `data[s-1][v-1]` → array of word objects
2. For each word: load font `QCF4_Hafs_{p:02d}_W.ttf` and emit `chr(c)` in an element with that font-family

## Example — Ayat al-Kursi (2:255)

51 words, all in `QCF4_Hafs_04_W` (covers a range of pages including page 42).
Codepoints start at U+F152.

## Source

Imported from [NaifAlsultan/typst-quran-package](https://github.com/NaifAlsultan/typst-quran-package) (`src/hafs.json`). Compatible with our `QCF4_Hafs_NN_W.ttf` files since the font codepoint scheme is identical (each font covers a sequential range of words via PUA codepoints starting at U+F100).
