#!/usr/bin/env bash

# Dependencies: xclip, pdflatex, imagemagick (convert)
# Make sure they are installed: sudo apt install xclip texlive-latex-base imagemagick

OUTDIR=~/Pictures/mylatex
mkdir -p "$OUTDIR"

# Read LaTeX code from clipboard
LATEX_CODE=$(xclip -selection clipboard -o)

# Generate temporary .tex file
TMPDIR=$(mktemp -d)
TEXFILE="$TMPDIR/temp.tex"
PNGFILE="$OUTDIR/latex_$(date +%s).png"

cat <<EOF > "$TEXFILE"
\documentclass[border=2pt]{standalone}
\usepackage{amsmath}
\usepackage{amssymb}
\begin{document}
\[
$LATEX_CODE
\]
\end{document}
EOF

# Compile to PDF
pdflatex -interaction=nonstopmode -output-directory="$TMPDIR" "$TEXFILE" >/dev/null 2>&1

open "$TMPDIR/temp.pdf"
# Convert PDF to PNG
file_date=$(date +%Y%m%d_%H%M%S)
convert -density 300 "$TMPDIR/temp.pdf" -quality 90 "$OUTDIR/latex_$file_date.png"
echo "$PNGFILE" | xclip -selection clipboard

echo "Saved PNG to: $PNGFILE and copied path to clipboard."
# Cleanup

