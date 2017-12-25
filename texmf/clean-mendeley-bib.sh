#!/bin/bash

MENDELEY_BIB_DIR=~/.texmf/bibtex/bib/mendeley/
FIELDS_TO_REMOVE="url doi issn isbn pmid"

for FIELD in $FIELDS_TO_REMOVE
do
	# find $MENDELEY_BIB_DIR -type f -name "*.bib" -exec grep "^$FIELD" {}  ';'
	find $MENDELEY_BIB_DIR -type f -name "*.bib" -exec sed -i -e /^$FIELD/d {}  ';'
done
