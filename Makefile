.PHONY : build package pin mkdirs clean

build : mkdirs build/index.html

build/index.html : config.el src/index.org
	emacs src/index.org -Q --batch -l ../config.el -f org-html-export-to-html --kill
	mv src/index.html build/index.html

package : dist/site.tar.gz

dist/site.tar.gz : build/index.html
	cd build && tar -zvc . > ../dist/site.tar.gz

pin : build
	node -r dotenv/config pin.js

mkdirs :
	@mkdir -p build dist

clean :
	rm -rf build dist
