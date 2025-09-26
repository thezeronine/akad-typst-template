.PHONY: typst-watch
typst-watch:
	typst watch main.typ main.pdf --root .

.PHONY: typst-compile
typst-compile:
	typst compile main.typ main.pdf --root .
