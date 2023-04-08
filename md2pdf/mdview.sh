#!/bin/bash
READER="${PDF_READER:=zathura}"
FILENAME="$(basename "$1")"
OUTFILE="/tmp/${FILENAME%.md}.pdf"
md2pdf "$1" "$OUTFILE"
( $READER "$OUTFILE" ) &> /dev/null
