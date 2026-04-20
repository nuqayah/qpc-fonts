# v1.5 data

`mushaf.txt` here is **a direct copy of `../../v1/data/mushaf.txt`**. v1.5 and v1 share the same PUA codepoint scheme (U+FB50–U+FC79): every codepoint in v1's data renders the same word when set against the v1.5 per-page font as against v1's.

Kept as its own copy (not a symlink) so GitHub's raw CDN and per-directory consumers both work without indirection.

Pairing rule: take any line `<page>,<glyphs>` from this file, set `font-family: 'page_{page}'` (the v1.5 font name), and the page font draws each glyph as the corresponding word.

See [`../../README.md`](../../README.md) for the overall page-glyph architecture.
