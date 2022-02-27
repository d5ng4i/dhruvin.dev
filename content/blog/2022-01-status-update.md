---
title: "2022-01 Status Update"
date: 2022-02-25T18:06:20+05:30
categories:
- misc
tags:
- guixrus
- sourcehut
- website
series:
- status-update
---

### Website

I was working on [my website](https://git.sr.ht/~dhruvin/dhruvin.dev)
throughout the month. It used to be [written in Org
Mode](https://git.sr.ht/~dhruvin/dhruvin.dev/tree/org) which was compiled to
html and gmi using ox-html and ox-gemini respectively.

I *enjoy* educating. I wish to publish educational content on my website in
future. I knew that my Org Mode setup will have problems when I will want to
add rich media on my website. I looked for static site generators that better
suited my needs. I decided to go with [hugo](https://gohugo.io).

I invested several days into learning hugo, and configuring it for my website.
I replaced my org mode setup with it, once I got comfortable with it. To
replace existing style setup, I started using [Vanilla
CSS](https://vanillacss.com/), a minimal CSS baseline stylesheet. But I wanted
to use grids and pre-made CSS components, so I replaced vanilla-css with
[bulma](https://bulma.io/). One thing yet to be completed in my website's
cosmetics department is a dark theme. But the [Dark
Reader](https://darkreader.org/) extension works fine for me, so we'll see when
can I get myself to do it.

### Contributions

#### pages.sr.ht

I've been hosting my personal website on [sourcehut pages](https://srht.site).
It lacked support for custom 404.html page. I implemented it and sent the patch
upstream. Since it was my first contribution with go code, I expected requests
for improvement. The feature is GraphQL only, by design. I updated the build
job of my website
[accordingly](https://git.sr.ht/~dhruvin/dhruvin.dev/commit/d232be3b2c0dd085a42d4013953e4d98a0f2e160).
I intend to add support of said feature to [hut](https://sr.ht/~emersion/hut)
soon.

- [[PATCH pages.sr.ht v6] Add support for custom 404.html page](https://lists.sr.ht/~sircmpwn/sr.ht-dev/patches/28884)

#### builds.sr.ht-guix

Guix was failing from around the beginning of the month. After days of
investigation, I found out that guix pull was going out of memory while
building newer guix image in sourcehut builder. I submitted a patch that fixed
it.

- [[PATCH builds.sr.ht] images/guix: Increase the memory for guix pull](https://lists.sr.ht/~sircmpwn/sr.ht-dev/patches/28881)

#### doug

There was no comprehensive way of getting metadata out of a guix channel. I
developed [Doug](https://git.sr.ht/~dhruvin/doug) to address this issue. This
guile module will help guix channel maintainers in serializing their channel
metadata to further use in a completely different context. For example in a
[website](https://whereis.みんな/).

If you'd like to use it,
[here](https://git.sr.ht/~whereiseveryone/website/commit/70b488a08fac1f91e2d4154e20f1111019a9557f#guixrus.scm)
is how you can do it.

#### guixrus

Last year, I found out about a guix channel called
[Guix R Us](https://sr.ht/~whereiseveryone/guixrus/) which is maintained by
[whereiseveryone](https://sr.ht/~whereiseveryone/) community. I liked the idea
and started contributing to it this month. I submitted patches that automated
the website generation using [Doug](https://git.sr.ht/~dhruvin/doug) and
improved the contributor experience:

- [[PATCH guixrus] docs: Suggest .gitconfig for contributions](https://lists.sr.ht/~whereiseveryone/guixrus/patches/27990)
- [[PATCH website] Automate the deployment using builds.sr.ht](https://lists.sr.ht/~whereiseveryone/public-inbox/patches/28078)
- [[PATCH website] Add .gitconfig with recommended git flags](https://lists.sr.ht/~whereiseveryone/public-inbox/patches/28083)
- [[PATCH guixrus v2] ci: Add .build.yml with lint and publish tasks](https://lists.sr.ht/~whereiseveryone/guixrus/patches/28157)
- [[PATCH website] docs: Add sourcehut build status badge](https://lists.sr.ht/~whereiseveryone/public-inbox/patches/28177)
- [[PATCH wiki] Document how to use todo.sr.ht](https://lists.sr.ht/~whereiseveryone/public-inbox/patches/28348)
- [[PATCH guixrus] ci: Lint guixrus packages only](https://lists.sr.ht/~whereiseveryone/guixrus/patches/28193)

Currently, the build job lints *all* guix packages, including the ones from
official guix channel. I submitted a patch to lint only the guixrus packages.
Which was later reverted due to problems with it, where guix was considering
the utility guile script I wrote to be a part of the guixrus channel. I indent
to submit another patch which fixes this.

### Non GNU

As I shared in my [previous post]({{< ref "2021-year-in-review" >}}), last year
I wanted to explore and use Alpine Linux. In the beginning of the month I also
decided to explore everything *not* GNU; thinking *"in for a penny, in for a
pound"*. Here are the software I replaced around this month (I may be
forgetting some):

- Login Manager: [gdm](https://wiki.gnome.org/Projects/GDM) -> [greetd](https://git.sr.ht/~kennylevinsen/greetd/) + [gtkgreet](https://git.sr.ht/~kennylevinsen/gtkgreet/)
- Seat Manager: [elogind](https://github.com/elogind/elogind) -> [seatd](https://sr.ht/~kennylevinsen/seatd/)
- Display Server: [X11](https://www.x.org/wiki/) -> [wayland](https://wayland.freedesktop.org/)
- Window Manager: [exwm](https://github.com/ch11ng/exwm) -> [sway](https://swaywm.org/)
- Editor: [emacs](https://www.gnu.org/software/emacs/) -> [neovim](https://neovim.org)
- Email Client: [emacs](https://www.gnu.org/software/emacs/) + [notmuch](https://notmuchmail.org) -> [aerc](https://aerc-mail.org/) + [notmuch](https://notmuchmail.org)
- IRC Client: [ERC](https://www.gnu.org/software/emacs/erc.html) -> [weechat](https://weechat.org/)
- RSS Reader: [elfeed](https://github.com/skeeto/elfeed) -> [newsboat](https://newsboat.org/)
- Terminal: [vterm](https://github.com/akermu/emacs-libvterm) buffers -> [alacritty](https://github.com/alacritty/alacritty) + [tmux](https://github.com/tmux/tmux)

### Conclusion

Last month was all about the transition. I hope to continue becoming good with
this new setup as I get more used to it in upcoming months. Since I don't have
much experience with writing, especially in English, my writing may be crude,
which I will improve upon. Suggestions are welcome! Peace.
