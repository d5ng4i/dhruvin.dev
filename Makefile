.PHONY : build package pin clean

build :
	emacs -Q --batch $(BUILD_FLAGS) -l config.el -f org-publish-all --kill

package :
	cd build/site && tar -zvc . > ../site.tar.gz
	cd build/capsule && tar -zvc . > ../capsule.tar.gz

pin :
	node -r dotenv/config pin.js

clean :
	rm -rf build
