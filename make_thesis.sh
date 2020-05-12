#! /bin/bash

xelatex --synctex=1 -shell-escape -src-specials -interaction=nonstopmode ./thesis.tex
bibtex thesis.aux
xelatex --synctex=1 -shell-escape -src-specials -interaction=nonstopmode ./thesis.tex
xelatex --synctex=1 -shell-escape -src-specials -interaction=nonstopmode ./thesis.tex