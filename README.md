### خطوط مجمع الملك فهد لطباعة المصحف
### King Fahd Qur'an Printing Complex Fonts

**Live preview:** <https://nuqayah.github.io/qpc-fonts/>

Fonts and text sources from the KFGQPC, grouped by riwaya. Original font files can also be retrieved from:
 - `http://qurancomplex.gov.sa/TTF/` + filename
 - or the [Windows installer](http://qurancomplex.gov.sa/Downloads/Fonts/AllPartsFonts.zip)
 - _Other_ fonts: <http://fonts.qurancomplex.gov.sa>

#### Repository layout

```
<riwaya>/               text sources + non-page-glyph assets per riwaya
<riwaya>-glyphs/vX/     page-based mushaf fonts (one glyph = one word/page)
  ├── fonts/            .ttf, .woff, .woff2 (flat, all formats mixed)
  └── data/mushaf.txt   glyph → word map for this version

other-fonts/fonts/      cross-riwaya / non-mushaf fonts
scripts/                prep_qpc_mushaf.py, build_web_formats.sh
docs/                   GitHub Pages preview site
```

Riwayat present today: `hafs/`, `warsh/`, `qaloun/`, `bazzi/`, `douri/`, `qunbul/`, `shuba/`, `sousi/`.
Page-glyph fonts present today: `hafs-glyphs/v1`, `hafs-glyphs/v1.5`, `hafs-glyphs/v2`, `hafs-glyphs/v4`, `warsh-glyphs/v4`.

#### Usage

##### Other fonts (regular Unicode Arabic text)
```css
@font-face {
  font-family: 'Uthman Naskh';
  src: local('KFGQPC Uthman Taha Naskh'),
       url('https://raw.githubusercontent.com/nuqayah/qpc-fonts/master/other-fonts/fonts/UthmanTN1%20Ver10.woff2') format('woff2');
}
@font-face {
  font-family: 'Uthman Naskh';
  font-weight: bold;
  src: local('KFGQPC Uthman Taha Naskh Bold'), local('KFGQPCUthmanTahaNaskh-Bold'),
       url('https://raw.githubusercontent.com/nuqayah/qpc-fonts/master/other-fonts/fonts/UthmanTN1B%20Ver10.woff2') format('woff2');
}
@font-face {
  font-family: 'Uthman Hafs';
  src: local('KFGQPC Uthmanic Script HAFS'),
       url('https://raw.githubusercontent.com/nuqayah/qpc-fonts/master/other-fonts/fonts/UthmanicHafs1%20Ver09.woff2') format('woff2');
}
@font-face {
  font-family: 'QPC Symbols';
  src: local('KFGQPC Arabic Symbols 01'),
       url('https://raw.githubusercontent.com/nuqayah/qpc-fonts/master/other-fonts/fonts/Symbols1_Ver02.woff2') format('woff2');
}
```

##### Page-glyph (mushaf) fonts
```css
@font-face {
  font-family: 'Mushaf Ligatures';
  src: local('QCF_BSML'),
       url('https://raw.githubusercontent.com/nuqayah/qpc-fonts/master/hafs-glyphs/v1/fonts/QCF_BSML.woff2') format('woff2');
}
@font-face {
  font-family: 'Mushaf Page NNN';
  src: local('QCF_PNNN'),
       url('https://raw.githubusercontent.com/nuqayah/qpc-fonts/master/hafs-glyphs/v1/fonts/QCF_PNNN.woff2') format('woff2');
}
```
Replace `NNN` with the actual page number (`001`–`604`). Each page font uses one glyph per word — see `hafs-glyphs/v1/data/mushaf.txt` (and `hafs-glyphs/v2/data/mushaf.txt` for v2).

> Pin these URLs to a commit SHA or a release tag for production — `master` is not immutable.

#### Building web formats

`scripts/build_web_formats.sh` walks every `fonts/` directory and generates missing `.woff` / `.woff2` from the `.ttf` / `.otf` sources. Requires `woff2_compress` (`brew install woff2`) and optionally `sfnt2woff-zopfli` (`brew install sfnt2woff-zopfli`).

```sh
bash scripts/build_web_formats.sh
```

#### Preparing text sources

`scripts/prep_qpc_mushaf.py` normalizes raw text-mushaf output (e.g. pandoc conversion of the KFGQPC docx sources) into one-ayah-per-line form.

```sh
pip install -r scripts/requirements.txt
python scripts/prep_qpc_mushaf.py qaloon qaloun/text/UthmanicQaloun_V21/<file>.txt
```

#### License

Fonts © KFGQPC — [license](http://dm.qurancomplex.gov.sa/copyright-2/).
Tooling in this repo is MIT — see [LICENSE](LICENSE).
