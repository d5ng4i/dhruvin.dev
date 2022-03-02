---
title: "2022-02 Status Update"
date: 2022-03-01T12:07:20+05:30
categories:
- misc
tags:
- alpine
- sourcehut
- website
series:
- status-update
---

### Website

When I used to author my website in [Org
Mode](https://git.sr.ht/~dhruvin/dhruvin.dev/tree/org), I used to make it
available via HTTPS, GEMINI, IPFS (with automated IPNS), and TOR protocols.
This made it harder to port my website to hugo seamlessly. For past two months,
I was getting the HTTPS part right with hugo. Unfortunately, I had to drop
support for the rest. This month, I looked for options to publish the content
to various output formats. It's well supported in hugo and it will allow me to
make my website be accessible via all aforementioned protocols.

I asked my friends for suggestions to improve the looks of my website. I
incorporated them during this month. You might see those changes in this post.

I also added [tags]({{< ref "tags" >}}), [series]({{< ref "series" >}}), and
[categories]({{< ref "categories" >}}) to the posts, which you can see below
the title of this post. This will help navigate my website better. See [Hello
World]({{< ref "hello-world" >}}) post of my blog for a primer on this. I
intend to work on list layouts of the `blog`, `tags`, `series`, and
`categories` pages next month.

I started minifying and [purging css
files](https://git.sr.ht/~dhruvin/dhruvin.dev/commit/7c74834f7df5b0009c2dc0ba0430dd700fecd753)
with [PostCSS](https://postcss.org/) and
[postcss-purgecss](https://github.com/FullHuman/postcss-purgecss) plugin to
improve website's performance. If you're reading this in a browser capable of
using css stylesheets, I saved 25KB of your bandwidth. *"It ain't much, but
it's honest work"*.

### Contributions

I was learning hugo and upgrading my website. This kept me busy and I couldn't
contribute to open source projects much.

#### aports

I reviewed and corrected a [merge
request](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/31149)
that upgrades [todoman](https://github.com/pimutils/todoman) alpine package to
v4.1.0.

- [testing/todoman: remove remove-rtd-theme.patch](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/31272)

#### hut

As [promised]({{< ref "2022-01-status-update#pagessrht" >}}) in [last status
update]({{< ref "2022-01-status-update" >}}), I added `--subdirectory` and
`--not-found` flags to [hut](https://sr.ht/~emersion/hut). This will allow
[pages.sr.ht](https://srht.site) users to configure the subdirectory they want
to publish to and a custom page for not found responses respectively.

Example:

```
$ hut pages publish </path/to/site.tar.gz> \
  --domain <example.com> \
  --subdirectory </path/to/publish/to> \
  --not-found </path/to/404.html>
```

- [[PATCH 0/2] pages publish: Add subdirectory support](https://lists.sr.ht/~emersion/hut-dev/patches/29739)
- [[PATCH v2] pages publish: Add --not-found](https://lists.sr.ht/~emersion/hut-dev/patches/29932)

#### pages.sr.ht

While looking at a [lighthouse](https://github.com/GoogleChrome/lighthouse)
report for possible improvements, a friend and I discovered that my website
host returned custom 404.html page for robots.txt (as expected), but with 200
status code. I fixed the bug and submitted a patch upstream. This, along with
the patches mentioned above, marks the completion of a feature I wanted.

- [[PATCH pages.sr.ht] Respond with 404 statusCode for notFound page](https://lists.sr.ht/~sircmpwn/sr.ht-dev/patches/29873)

### Conclusion

I learned and configured hugo, and tmux. Played Minecraft and many DotA2 games
with friends. Recently, I started learning [Go](https://go.dev) with
[GraphQL](https://graphql.org), to develop maintainable APIs in future.

I started working on an end-to-end encrypted shared ledger web application
called [iou](https://sr.ht/~dhruvin/iou). It's intended to replace Splitwise
for a subset of use-cases.

I also started publishing the website's
[word-list](https://git.sr.ht/~dhruvin/dhruvin.dev/commit/77d7560c19ef176c0bd33117aa49011fda86c6ce#en.utf-8.add).

Thanks [Chintan](https://chintanacharya.dev), [Dixita](https://dixita.dev),
[Varun](https://varunbarad.com), and
[Vatsal](mailto:trivedivatsal005@gmail.com) for your suggestions and
corrections.
