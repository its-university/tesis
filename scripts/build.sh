#!/usr/bin/env bash
# Compile cover.tex, then main.tex with pdfLaTeX -> BibTeX -> pdfLaTeX x 2.
# Used by .github/workflows/build.yml and can be run locally from any directory.
#
# Fails if a step fails or if main.pdf still has undefined references or
# citations (which would show up as ?? in the PDF).
set -euo pipefail

project_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$project_root"

pdflatex_opts=(-interaction=nonstopmode -halt-on-error -file-line-error)

pdflatex "${pdflatex_opts[@]}" cover.tex
pdflatex "${pdflatex_opts[@]}" main.tex

# BibTeX exits with 1 when it only has warnings and 2 or more on errors
bibtex_status=0
bibtex main || bibtex_status=$?
if [ "$bibtex_status" -gt 1 ]; then
	echo "error: bibtex failed with exit code $bibtex_status" >&2
	exit "$bibtex_status"
fi

pdflatex "${pdflatex_opts[@]}" main.tex
pdflatex "${pdflatex_opts[@]}" main.tex

if grep -E "There were undefined (references|citations)|Rerun to get|Citation .* undefined|Reference .* undefined" main.log; then
	echo "error: main.pdf has unresolved references or citations (see the lines above)" >&2
	exit 1
fi

echo "Done: cover.pdf and main.pdf"
