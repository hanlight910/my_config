#!/bin/bash

# Create temp working directory
workdir=~/Pictures/resources/
FILE_NAME=$(date +%Y%m%d_%H%M%S)

cd "$workdir" || exit

# Get LaTeX from clipboard
xclip -o -selection clipboard > input.tex

# Write LaTeX header
cat <<EOF > "$FILE_NAME.tex"
\documentclass[preview]{standalone}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{xcolor}
\begin{document}
\begin{center}
\begin{gather*}
EOF

# Append actual clipboard content
cat input.tex >> "$FILE_NAME.tex"

# Write LaTeX footer
cat <<EOF >> "$FILE_NAME.tex"
\\\\
\end{gather*}
\end{center}
\end{document}
EOF

# Compile to PDF
pdflatex -interaction=nonstopmode "$FILE_NAME.tex" >/dev/null

# Convert PDF to transparent PNG
convert -density 300 "$FILE_NAME.pdf" -quality 100 -background white -flatten "$FILE_NAME.png"

# Copy to clipboard
echo -n "$workdir/$FILE_NAME.png" | xclip -selection clipboard 

echo "✅ Output: $workdir/$FILE_NAME.png"


