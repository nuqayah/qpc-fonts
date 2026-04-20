# Page-glyph fonts (Hafs)

These fonts don't render regular Unicode Arabic text. Each glyph is a **single pre-shaped word pinned to a specific mushaf page** — you cannot use them to render arbitrary text, only mushaf content you've looked up in the accompanying data file.

## Font ↔ data ↔ page mapping per version

| Version | Fonts in this repo | Page → font | Data file | Format |
|---|---|---|---|---|
| `v1/fonts/` | 604 + basmalah (`QCF_P001.ttf` … `QCF_P604.ttf`, `QCF_BSML.ttf`) | one font per page: page N → `QCF_P{N:03d}` | `v1/data/mushaf.txt` | line per ayah: `page,glyphs` |
| `v1.5/fonts/` | 604 (`page_1.ttf` … `page_604.ttf`) | one font per page: page N → `page_{N}` | `v1.5/data/mushaf.txt` (copy of v1; same codepoint scheme) | same as v1 |
| `v2/fonts/` | 100 (`QCF2001.ttf` … `QCF2100.ttf`) | one font per page: page N → `QCF2{N:03d}`. **Only pages 1–100 shipped here** — pages 101–604 have no font in this repo. | `v2/data/mushaf.txt` | same format as v1 |
| `v4/fonts/` | 47 (`QCF4_Hafs_01_W.ttf` … `QCF4_Hafs_47_W.ttf`) | ~13 pages per font — each word carries its own `p` (font number) in the data | `v4/data/quran.json` | word-level `[114 surahs][verses][words {p, c}]` |

## How to render an ayah

### v1 / v1.5 / v2 (line-per-ayah txt format)

1. Find the relevant line in `<version>/data/mushaf.txt`. Each line is `<page>,<glyphs>`.
2. Set `font-family` on an element containing `<glyphs>`:
   - v1  → `'QCF_P{page:03d}'` (e.g. `QCF_P042`)
   - v1.5 → `'page_{page}'` (e.g. `page_42`)
   - v2  → `'QCF2{page:03d}'` (e.g. `QCF2042`)
3. Add `direction: rtl; unicode-bidi: bidi-override` in CSS — PUA codepoints default to LTR bidi, which would scramble word order when a line wraps.

### v4 (JSON per-word format)

```json
[ // 114 surahs
  [ // verses
    [ // words
      {"p": 4, "c": 61778},   // p = font number → QCF4_Hafs_{p:02d}_W.ttf
      {"p": 4, "c": 61779},   // c = PUA codepoint to render with that font
      ...
    ]
  ]
]
```

To render surah `s`, verse `v`: iterate `data[s-1][v-1]`, load each word's font, and emit `String.fromCodePoint(c)` in an element with that font-family.

## Example — Ayat al-Kursi (2:255), all on page 42

| Version | Font | Glyphs |
|---|---|---|
| v1 | `QCF_P042.ttf` | `ﮣﮤﮥﮦﮧﮨﮩﮪﮫﮬﮭﮮ...` |
| v1.5 | `page_42.ttf` | same codepoints as v1 |
| v2 | `QCF2042.ttf` | `ﲓﲔﲕﲖﲗﲘﲙﲚﲛﲜﲝﲞ...` |
| v4 | `QCF4_Hafs_04_W.ttf` | 51 codepoints U+F152 … U+F18C |

A rendered comparison lives in `../docs/index.html`.

## Sources

- `v1`, `v1.5`, `v2`: KFGQPC font set distributed by the Madinah Mushaf complex; `mushaf.txt` files are the ayah→glyph indexes that ship with those releases.
- `v4/data/quran.json`: imported from [NaifAlsultan/typst-quran-package](https://github.com/NaifAlsultan/typst-quran-package) (`src/hafs.json`). The fonts in `v4/fonts/` are byte-identical to theirs, so the mapping applies directly.
- Cross-qiraa ayah-number mappings (Hafs ↔ Warsh/Qaloun/Duri/…): [quranpedia/qiraat-ayah-map](https://github.com/quranpedia/qiraat-ayah-map).
