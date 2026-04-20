# Changelog

## Unreleased — Layout v2

Riwaya-first restructure. Every top-level directory before this change has moved.

### Breaking — path rename table

| Before | After |
|---|---|
| `mushaf/QCF_PNNN.TTF` | `hafs-glyphs/v1/fonts/QCF_PNNN.ttf` *(extension lowercased)* |
| `mushaf-woff/QCF_PNNN.woff` | `hafs-glyphs/v1/fonts/QCF_PNNN.woff` |
| `mushaf-woff2/QCF_PNNN.woff2` | `hafs-glyphs/v1/fonts/QCF_PNNN.woff2` |
| `mushaf.txt` | `hafs-glyphs/v1/data/mushaf.txt` |
| `mushaf-v1.5/` | `hafs-glyphs/v1.5/fonts/` |
| `mushaf-v2/` | `hafs-glyphs/v2/fonts/` |
| `mushaf-v2.txt` | `hafs-glyphs/v2/data/mushaf.txt` |
| `mushaf-v4-hafs/` | `hafs-glyphs/v4/fonts/` |
| `mushaf-v4-warsh/` | `warsh-glyphs/v4/fonts/` |
| `text-mushafs/UthmanicHafs*`, `HafsNastaleeq*` | `hafs/text/` |
| `text-mushafs/UthmanicWarsh_V21` | `warsh/text/UthmanicWarsh_V21` |
| `text-mushafs/UthmanicQaloun_V21` | `qaloun/text/UthmanicQaloun_V21` |
| `text-mushafs/UthmanicBazzi_V20` | `bazzi/text/UthmanicBazzi_V20` |
| `text-mushafs/UthmanicDouri_V20` | `douri/text/UthmanicDouri_V20` |
| `text-mushafs/UthmanicQunbul_V20` | `qunbul/text/UthmanicQunbul_V20` |
| `text-mushafs/UthmanicShuba_V20` | `shuba/text/UthmanicShuba_V20` |
| `text-mushafs/UthmanicSousi_V20` | `sousi/text/UthmanicSousi_V20` |
| `various/`, `various-woff/`, `various-woff2/` | `other-fonts/fonts/` *(formats merged flat)* |
| `prep_qpc_mushaf.py` | `scripts/prep_qpc_mushaf.py` |

CDN hotlinks that pinned to a commit SHA continue to work against their pinned SHA. Hotlinks on `master`/`HEAD` break and must be updated to the paths above.

### Added

- `docs/` — GitHub Pages site with a live preview of every font (`docs/index.html`) and a copy-paste `@font-face` recipe (`docs/demo.html`).
- `scripts/build_web_formats.sh` — regenerates `.woff` / `.woff2` from every `.ttf` / `.otf` in any `fonts/` directory.
- `scripts/requirements.txt` — declares the `regex` dependency for `prep_qpc_mushaf.py`.
- `LICENSE` — in-tree pointer to the KFGQPC license (fonts) + MIT on the tooling.
- `.gitattributes` — marks fonts and docx as binary so diffs stay clean.
