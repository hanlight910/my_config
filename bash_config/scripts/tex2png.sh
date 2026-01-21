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
file_date=$(date +%Y%m%d_%H%M%S)
PNGFILE="$OUTDIR/latex_$file_date.png"

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

# Convert PDF to PNG (trim, white background, rounded corners)
convert -density 300 "$TMPDIR/temp.pdf" -quality 90 -trim +repage \
  -background white -alpha remove \
  -bordercolor white -border 15 \
  \( +clone -alpha extract \
     -draw 'fill black polygon 0,0 0,15 15,0 fill white circle 15,15 15,0' \
     \( +clone -flip \) -compose Multiply -composite \
     \( +clone -flop \) -compose Multiply -composite \
  \) -alpha off -compose CopyOpacity -composite \
  "$PNGFILE"
echo -n "$PNGFILE" | xclip -selection clipboard

echo "Saved PNG to: $PNGFILE and copied path to clipboard."
# Cleanup

