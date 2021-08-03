.PHONY : build build/site build/capsule package pin mkdirs clean

build : mkdirs build/site build/capsule

build/site : build/site/index.html

build/site/index.html : config.el src/index.org
	emacs src/index.org -Q --batch $(BUILD_FLAGS) -l ../config.el -f org-html-export-to-html --kill
	mv src/index.html $@

build/capsule : build/capsule/index.gmi

build/capsule/index.gmi : config.el src/index.org
	emacs src/index.org -Q --batch $(BUILD_FLAGS) -l ../config.el -f org-gemini-export-to-file --kill
	mv src/index.gmi $@

package : build/site.tar.gz build/capsule.tar.gz

build/site.tar.gz : build/site
	cd build/site && tar -zvc . > ../site.tar.gz

build/capsule.tar.gz : build/capsule
	cd build/capsule && tar -zvc . > ../capsule.tar.gz

pin : build
	node -r dotenv/config pin.js

mkdirs :
	@mkdir -p build/site build/capsule

clean :
	rm -rf build
