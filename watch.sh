#!/usr/bin/env bash
# watch.sh — ricompila main.tex ad ogni salvataggio

# richiede entr: brew install entr
SEARCH_PATH="$(dirname "$(kpsewhich biblatex.sty)")"

while true; do
  find . \( -name "*.tex" -o -name "*.bib" \) | entr -dc \
    tectonic -X compile -Z search-path="$SEARCH_PATH" main.tex
done