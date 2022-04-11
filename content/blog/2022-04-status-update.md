---
title: "2022-04 Status Update"
summary: >
  Updates about work on guixrus, guix, and sourcehut projects while on a
  workation.
date: 2022-05-03T14:30:00+05:30
categories:
- status-update
tags:
- guixrus
- guix
- sourcehut
---

### Contributions

#### guixrus

As mentioned [earlier]({{< ref "2022-01-status-update#guixrus" >}}), I tried to
lint only guixrus packages. But I failed because guix considered that guile
script to be part of the channel. I fixed the issue by making it an executable.
I went *full guile* this time and made the linter not use shell at all. This
way, we won't have to append all guixrus packages to command line args, as
mentioned in [last post]({{< ref "2022-03-status-update#guixrus" >}}).

I was [asked](https://todo.sr.ht/~whereiseveryone/guixrus/28#event-170548) to
be added to authorized commiters'
[list](https://git.sr.ht/~whereiseveryone/guixrus/tree/master/item/.guix-authorizations)
of [guixrus](https://sr.ht/~whereiseveryone/guixrus). From now on, I can review
and apply patches to guixrus.

I incorrectly added the fingerprint of my public key to `.guix-authorization`
of guixrus, and had to fix it. guix expects fingerprint of the signing (sub)key
instead. This is why I admire guix design. Even if someone manages to push
(possibly malicious) commits to master, their commits will be rejected by guix
package manager due to absence of an authorized signature.

Pulling from official guix channel always works. I wanted the same for guixrus.
I created a build job that tests whether guix is able to pull and build guixrus
from its latest commit. This will make guixrus more reliable. We are also
working a peer review process to make sure that commits to master don't break
the channel.

I packaged hut for guixrus while working on a more complete [upstream
package](#guix). The hut guixrus package will eventually be removed when it's
in upstream.

- [[PATCH guixrus v2] ci: Lint guixrus packages only](https://lists.sr.ht/~whereiseveryone/guixrus/patches/30829)
- [[PATCH guixrus] add dhruvin.key](https://lists.sr.ht/~whereiseveryone/guixrus/patches/31023)
- [[PATCH guixrus] add dhruvin to .guix-authorizations](https://lists.sr.ht/~whereiseveryone/guixrus/patches/31024)
- [[PATCH guixrus] Correct dhruvin's key's fingerprint](https://lists.sr.ht/~whereiseveryone/guixrus/patches/31356)
- [ci: verify that guix pull works with latest commit](https://git.sr.ht/~whereiseveryone/guixrus/commit/121ebf0c3bfb7c244778cffd8b365431b5f7433f)
- [hut: keep minimal dependencies](https://git.sr.ht/~whereiseveryone/guixrus/commit/9c34df226dda73afe734d6c93466d139fe53b58a)

#### guix

As mentioned above, I packaged hut for guix. This will also allow sourcehut
guix build image users to seamlessly interact with sourcehut services and
resources.

- [[PATCH] gnu: go-github-com-spf13-cobra: Update to 1.4.0.](https://issues.guix.gnu.org/54888)
- [[PATCH 0/2] gnu: Add hut.](https://issues.guix.gnu.org/54882)

### Projects

#### builds.sr.ht-reactos

Well, this project was a fiasco. Started working on it thinking it'd be simpler
to get it working as [ReactOS](https://reactos.org) is being developed for two
decades now. Only setting up an SSH server is what's missing; I thought. Fast
forward a few days and I found myself trying to download packages from archaic
[Cygwin](https://www.cygwin.com) distribution mirrors (since newer, official
repository has stopped supporting ROS's architecture) just to be able to get
required programs and build [openssh server](https://www.openssh.com). I
encountered fatal kernel panics while building it. Saw the infamous *BSOD*
after a long time and lost motivation to work on it.

#### iou

I stopped working on IOU (a shared e2ee ledger), after deciding to focus on
prior projects first. I will probably revisit it once I complete pending
projects.

### Conclusion

I replaced [PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio)
and [JACK](https://jackaudio.org) with [Pipewire](https://pipewire.org). It
took me 3 days to understand (superficially) how it works and get things right.
But the efforts are worth it. I can now effortlessly play music using a MIDI
keyboard with very low latency while watching to a video online. Pipewire is
*justifiably all the rage* in linux audio.

I tried learning [LaTeX](https://www.latex-project.org) for the third time.
This time, enough to be able to author some documents for [my
wife](https://dixita.dev). I also dipped my toes into
[groff](https://www.gnu.org/software/groff) as an alternative to LaTeX. I
couldn't find an easy way to interpolate said LaTeX and groff documents with
external data. They seem to be formats good to author documents, and not
templates. We fell back to using handlebars and HTML to template and author
said documents respectively.

This month was me biting off more than I could chew. I was on a *workation* the
whole month. There isn't much to share since there wasn't much done. Stay tuned
for the next month. Peace.
