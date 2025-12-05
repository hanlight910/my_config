#!/bin/bash


FILE="$1"
libreoffice --headless --infilter=Hwp2002_File --convert-to pdf:writer_pdf_Export "$FILE"
PDF_FILE="${FILE%.*}.pdf"
xdg-open "$PDF_FILE"
rm "$FILE"
