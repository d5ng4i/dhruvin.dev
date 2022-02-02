.PHONY: build clean hugo openring package

build: hugo

clean:
	rm -rf public site.tar.gz

hugo:
	hugo --minify

openring:
	openring -S webring/webring.txt < webring/webring.html > layouts/partials/webring.html

package:
	cd public && tar -cvz . > ../site.tar.gz
