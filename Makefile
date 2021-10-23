.PHONY : build package clean

build :
	emacs -Q --batch -l config.el -f org-publish-all --kill

package :
	cd build/site && tar -zvc . > ../site.tar.gz
	cd build/capsule && tar -zvc . > ../capsule.tar.gz

clean :
	rm -rf build
