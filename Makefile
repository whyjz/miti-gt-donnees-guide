PDF := synthese_2020.pdf

OPT := 	--from markdown \
	--template=eisvogel.latex \
	--number-sections \
	--variable titlepage="True"
# 	--latex-engine=xelatex

md_files := $(sort $(filter-out README.md, $(wildcard *.md)))


action = pandoc -s --toc -o $@ $(md_files) $(OPT)
 
$(PDF): $(md_files) Makefile
	$(action)

html: $(md_files)
	mkdir -p public 
	pandoc -s --toc -c pandoc.css $^ -o public/index.html

.PHONY: clean

clean:
	rm -f $(PDF)

