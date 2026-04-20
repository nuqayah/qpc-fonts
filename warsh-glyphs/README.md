# Page-glyph fonts — Warsh

Same architecture as [`../hafs-glyphs/README.md`](../hafs-glyphs/README.md) — each glyph is a pre-shaped word pinned to a specific mushaf page.

## What's here

- `v4/fonts/` — 51 fonts `QCF4_Warsh_01_W.ttf` … `QCF4_Warsh_51_W.ttf` plus `uthmanic_warsh_v21.ttf`
- `v4/data/quran.json` — word-level PUA mapping, same `[surahs][verses][words {p, c}]` format as v4 Hafs. Imported from [NaifAlsultan/typst-quran-package](https://github.com/NaifAlsultan/typst-quran-package).

## Warsh ayah-counting note

Warsh counts **285 verses in Surah al-Baqarah** (Hafs counts 286). Where Hafs has a single long ayah, Warsh may split it into two. This is the case with **Ayat al-Kursi**, which lives at two consecutive indices in this data:

- `data[1][252]` — Warsh 2:253: opening 8 words (Allahu la ilaha illa huwa al-Hayy al-Qayyum)
- `data[1][253]` — Warsh 2:254: continuation 44 words (la ta'khuzuhu sinatun...)

To render the full Kursi in Warsh v4: concatenate both. Both use the same page font `QCF4_Warsh_04_W.ttf`.

For authoritative cross-qiraa ayah-number mappings (Hafs ↔ Warsh/Qaloun/Duri/etc.), see [quranpedia/qiraat-ayah-map](https://github.com/quranpedia/qiraat-ayah-map) — an open dataset covering the six canonical counting systems used by the ten qiraat.

For rendering Warsh text without the page-glyph indirection, use `warsh/text/UthmanicWarsh_V21/UthmanicWarsh V21.ttf` — that font renders regular Unicode Arabic text in Warsh orthography.
