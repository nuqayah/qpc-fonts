### خطوط مجمع الملك فهد لطباعة المصحف
### King Fahd Qur'an Printing Complex Fonts

**Live preview:** <https://nuqayah.github.io/qpc-fonts/>
**@font-face recipes:** <https://nuqayah.github.io/qpc-fonts/demo.html>

Fonts and text sources from the KFGQPC, grouped by riwaya. Original files can also be retrieved from:
- `http://qurancomplex.gov.sa/TTF/` + filename
- [Windows installer](http://qurancomplex.gov.sa/Downloads/Fonts/AllPartsFonts.zip)
- _Other_ fonts: <http://fonts.qurancomplex.gov.sa>

#### Repository layout

```
<riwaya>/               text sources + non-page-glyph assets per riwaya
  ├── fonts/            regular Arabic text fonts (Unicode)
  └── text/             text-mushaf sources (docx/json/ttf) for that riwaya

<riwaya>-glyphs/vX/     page-based glyph fonts (one glyph = one word/page)
  ├── fonts/            page fonts — must be paired with the data file
  └── data/             glyph→word mapping for this version

other-fonts/fonts/      general Arabic text fonts (Uthman Naskh) + QPC Symbols
                        — not Qur'an-specific and not tied to any riwaya
scripts/                prep_qpc_mushaf.py, build_web_formats.sh
docs/                   GitHub Pages preview site
```

Riwayat present: `hafs/`, `warsh/`, `qaloun/`, `bazzi/`, `douri/`, `qunbul/`, `shuba/`, `sousi/`.
Page-glyph versions: `hafs-glyphs/v1`, `v1.5`, `v2`, `v4`; `warsh-glyphs/v4`.

#### Fonts have two different architectures

1. **Text fonts** (everything under `<riwaya>/text/`, `<riwaya>/fonts/`, and `other-fonts/fonts/`) render normal Unicode Arabic text. Just declare `@font-face` and use them like any other font.

2. **Page-glyph fonts** (everything under `<riwaya>-glyphs/`) do **not** render Unicode text. Each glyph is a pre-shaped word pinned to a specific mushaf page. You must pair each font with its data file to know which codepoints to emit.

#### Font ↔ data pairing (page-glyph fonts)

| Version | Fonts in repo | Page → font | Data file | Format |
|---|---|---|---|---|
| `hafs-glyphs/v1/` | 604 per-page + `QCF_BSML` | `QCF_P{page:03d}` | `v1/data/mushaf.txt` | `page,glyphs` lines |
| `hafs-glyphs/v1.5/` | 604 per-page | `page_{page}` | `v1.5/data/mushaf.txt` (copy of v1; same codepoint scheme) | same |
| `hafs-glyphs/v2/` | 100 per-page | `QCF2{page:03d}` (pages 1–100 only in this repo) | `v2/data/mushaf.txt` | same |
| `hafs-glyphs/v4/` | 47 per-range | per-word `p` field | `v4/data/quran.json` | `[s][v][{p,c}]` |
| `warsh-glyphs/v4/` | 51 per-range | per-word `p` field | `v4/data/quran.json` | same |

See [`hafs-glyphs/README.md`](hafs-glyphs/README.md) and [`warsh-glyphs/README.md`](warsh-glyphs/README.md) for full rendering examples including browser-specific bidi handling (page-glyph text requires `unicode-bidi: bidi-override`).

#### Quick usage

Copy-paste `@font-face` snippets for every font are on the [recipes page](https://nuqayah.github.io/qpc-fonts/demo.html). One example:

```css
@font-face {
  font-family: 'Uthman Naskh';
  src: local('KFGQPC Uthman Taha Naskh'),
       url('other-fonts/fonts/UthmanTN1%20Ver10.woff2') format('woff2');
}
```

> Paths are relative to this repo's root — adjust the `url(...)` prefix to wherever you host the fonts in your own project.

#### Building web formats

`scripts/build_web_formats.sh` walks every `fonts/` directory and generates missing `.woff`/`.woff2` from the `.ttf`/`.otf` sources. Requires `woff2_compress` (`brew install woff2`) and optionally `sfnt2woff-zopfli`.

```sh
bash scripts/build_web_formats.sh
```

#### Preparing text sources

`scripts/prep_qpc_mushaf.py` normalizes raw text-mushaf output (e.g. pandoc conversion of KFGQPC docx sources) into one-ayah-per-line form.

```sh
pip install -r scripts/requirements.txt
python scripts/prep_qpc_mushaf.py qaloon qaloun/text/UthmanicQaloun_V21/<file>.txt
```

#### Cross-qiraa ayah numbering

Different riwayat use different ayah-counting systems (Hafs has 286 ayahs in al-Baqarah, Warsh 285, etc.). For authoritative cross-qiraa mappings, see [quranpedia/qiraat-ayah-map](https://github.com/quranpedia/qiraat-ayah-map).

#### License

Fonts © KFGQPC — [license](http://dm.qurancomplex.gov.sa/copyright-2/). Repo tooling is MIT — see [LICENSE](LICENSE).
