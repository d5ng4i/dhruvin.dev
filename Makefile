.PHONY: build clean hugo openring package

build: hugo

clean:
	rm -rf public site.tar.gz hugo_stats.json

hugo:
	hugo --minify

openring:
	openring -S webring/webring.txt < webring/webring.html > layouts/partials/webring.html

spf:
	uniq < en.utf-8.add | sort -o en.utf-8.add
	nvim -c "mkspell! en.utf-8.add" -c "qa!" --headless

package:
	cd public && tar -cvz . > ../site.tar.gz
