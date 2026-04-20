#!/usr/bin/env bash
# Regenerate .woff and .woff2 builds for every fonts/ directory next to a .ttf/.otf source.
#
# Requires:
#   - woff2_compress  (brew install woff2)
#   - sfnt2woff-zopfli (brew install sfnt2woff-zopfli) — falls back to sfnt2woff if unavailable
#
# Usage: bash scripts/build_web_formats.sh [path]
#   path defaults to the repo root (runs against every fonts/ directory under it).

set -euo pipefail

ROOT=${1:-$(git rev-parse --show-toplevel)}

if ! command -v woff2_compress >/dev/null; then
    echo "error: woff2_compress not found (brew install woff2)" >&2
    exit 1
fi

WOFF_TOOL=""
if command -v sfnt2woff-zopfli >/dev/null; then
    WOFF_TOOL=sfnt2woff-zopfli
elif command -v sfnt2woff >/dev/null; then
    WOFF_TOOL=sfnt2woff
else
    echo "warning: no sfnt2woff tool found — skipping .woff generation" >&2
fi

while IFS= read -r -d '' src; do
    dir=$(dirname "$src")
    base=$(basename "$src")
    stem=${base%.*}

    # woff2
    if [ ! -f "$dir/$stem.woff2" ]; then
        woff2_compress "$src" >/dev/null
    fi

    # woff (keeps TTF source untouched)
    if [ -n "$WOFF_TOOL" ] && [ ! -f "$dir/$stem.woff" ]; then
        "$WOFF_TOOL" "$src" >/dev/null 2>&1 || true
    fi
done < <(find "$ROOT" -type d -name fonts -print0 | xargs -0 -I{} find {} -maxdepth 1 \( -name '*.ttf' -o -name '*.otf' \) -print0)

echo "done"
