.PHONY: build clean deps gpg hugo openring package publish spf

GPG_KEYID=AF931F6B46EE2671AD228A1C72CECACDB63DDDA0
GPG_KEYPATH=static/public-key.asc
WKD_PATH=static/.well-known/openpgpkey
WKD_HASH=dj3498u4hyyarh35rkjfnghbjxug6b19 # gpg --list-key --with-wkd-hash ${GPG_KEYID}

build: hugo

clean:
	rm -rf public site.tar.gz hugo_stats.json

deps:
	npm ci

gpg:
	gpg --export --armour ${GPG_KEYID} > ${GPG_KEYPATH}
	mkdir -p ${WKD_PATH}/hu
	touch ${WKD_PATH}/policy
	gpg --export --no-armor ${GPG_KEYID} > ${WKD_PATH}/hu/${WKD_HASH}

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
