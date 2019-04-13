# This file builds the documentation using GAPDoc
# The files needed to produce the documentation are
# main.xml
# posets.xml
# install.xml
# manual.css
# makedoc.g
# posets.bib

path := Directory("./");;
main := "main.xml";;
files := [
		"../lib/posets.gd", "../lib/posets.gi"
];;
bookname := "posets";;
doc := ComposedDocument("GAPDoc", path, main, files, true);;

MakeGAPDocDoc( path, main, files, bookname);
