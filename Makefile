.PHONY: build clean hugo deps openring package publish spf

build: hugo

clean:
	rm -rf public site.tar.gz hugo_stats.json

deps:
	npm ci

hugo:
	hugo --minify

openring:
	openring -S webring/webring.txt < webring/webring.html > layouts/partials/webring.html

package:
	cd public && tar -cvz . > ../site.tar.gz

publish:
	hut pages publish site.tar.gz --domain dhruvin.dev --not-found /404.html

spf:
	uniq < en.utf-8.add | sort -o en.utf-8.add
	nvim -c "mkspell! en.utf-8.add" -c "qa!" --headless
