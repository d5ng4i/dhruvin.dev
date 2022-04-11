---
title: "2022-03 Status Update"
summary: >
  Updates about work on my website, sourcehut projects, alpine packages, guixrus,
  an openscad learning project, hledger, and some past projects.
date: 2022-04-02T20:26:11+05:30
categories:
- status-update
tags:
- alpine
- guixrus
- sourcehut
- website
---

### Website

I started writing parts of these monthly status updates as I work, almost every
other day. I no longer have to recall what I did in past month to write a post
about it.

I updated the layout of all list pages (e.g. [blog]({{< ref "blog" >}})), along
with updating categories and tags of each post. Only the *misc* posts (e.g.
[Hello World]({{< ref "hello-world" >}})) are now categorized as [misc]({{< ref
"misc" >}}).

Following [Chintan](https://chintanacharya.dev)'s suggestion, I added links to
the breadcrumbs of list pages (e.g. [status-update]({{< ref "status-update"
>}})).

I no longer depend on [openpgp.org](https://keys.openpgp.org) to host my
[public-key](https://dhruvin.dev/public-key.asc). The keyserver worked fine,
but I wanted to host the public key statically. I also started hosting
[WKD](https://git.sr.ht/~dhruvin/dhruvin.dev/commit/4df2b4468f9160d4ff8ee170bc9fe84ff31e4535)
to let people locate the public key from my email address.

```
gpg --locate-external-keys contact@dhruvin.dev
```

### Contributions

#### pages.sr.ht

I fixed an issue where the file for configured custom 404 page goes missing
from future site archives published to pages.sr.ht.

- [[PATCH pages.sr.ht] Serve a special 404 page for missing NotFound file](https://lists.sr.ht/~sircmpwn/sr.ht-dev/patches/29933)

#### builds.sr.ht

I co-authored a patch with [Simon Ser](https://emersion.fr), that adds support
for generating hut config on builds.sr.ht VMs. This was done to simplify
accessing/interacting with other sourcehut resources/services using hut (via
GraphQL APIs). One just needs to specify the
`oauth` field with required
scope(s) in their [build manifest](https://man.sr.ht/builds.sr.ht/manifest.md#oauth) to opt in.

Once it was deployed, we
[discovered](https://builds.sr.ht/~dhruvin/job/721828#task-cat-0) that
sourcehut workers weren't configured as expected. I added a fallback to [fix
it](https://builds.sr.ht/~dhruvin/job/725209#task-cat-0).

- [[PATCH builds.sr.ht v3] worker: create config file for hut](https://lists.sr.ht/~sircmpwn/sr.ht-dev/patches/30487)
- [[PATCH builds.sr.ht] worker: add fallback for instanceName of hutConfig](https://lists.sr.ht/~sircmpwn/sr.ht-dev/patches/30502)

#### names.sr.ht

I started working on a POC for a new service called names.sr.ht (to be a part
of sourcehut). The design is quite modular. One can add their own registrars to
defer the domain registration. This was inspired from various registrar
requests done on official names.sr.ht [mailing list
thread](https://lists.sr.ht/~bitfehler/names.sr.ht-discuss/%3CCHVUXZKXJJ4C.NB3VSS2CBXE1%40megumin%3E).

- [names.sr.ht](https://git.sr.ht/~dhruvin/names.sr.ht)

#### aports

I upgraded [hut](https://git.sr.ht/~emersion/hut)'s alpine package after my
[hut contributions]({{< ref "2022-02-status-update#hut" >}}) and [used it in my
website](https://git.sr.ht/~dhruvin/dhruvin.dev/commit/8758331c8784cabc1d43684ee511bd1d47fa5929).
I upgraded [hledger](https://hledger.org)\* packages to
[v1.25](https://github.com/simonmichael/hledger/releases/tag/1.25), and
[hledger-iadd](https://github.com/hpdeifel/hledger-iadd) package to
[v1.3.17](https://github.com/hpdeifel/hledger-iadd/releases/tag/v1.3.17). I
maintain 6 hledger packages/addons for alpine linux. Updating the
`cabal.project.freeze` file for all of them becomes tedious every upstream
upgrade. I wrote a shell script to automate these changes. Alpine uses shell
scripts to describe and build packages. I *absolutely love* this idea.
Automating writing and updating definitions for alpine linux packages becomes
trivial.

I packaged
[hledger-stockquotes](https://github.com/prikhi/hledger-stockquotes), to be
able to add commodities to my journals, and fetch daily prices automatically. I
also packaged [hledger-interest](https://github.com/peti/hledger-interest), to
calculate the interest occurred from my liabilities.

I packaged [Vintage Dreams Waves](https://analoguesque.x10host.com/SoundFonts/)
to be able to play music with
[fluidsynth](https://github.com/FluidSynth/fluidsynth).

- [testing/hut: upgrade to 0.0.0\_git20220302](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/31601)
- [testing/hledger\*: upgrade to 1.25](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/31743)
- [testing/hledger-iadd: upgrade to 1.3.17](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/32060)
- [testing/hledger-stockquotes: new aport](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/32062)
- [testing/hledger-interest: new aport](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/32075)
- [testing/soundfont-vintage-dreams-waves: new aport](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/32410)

#### guixrus

I [contributed]({{< ref "2022-01-status-update#guixrus" >}}) support for
linting [guixrus](https://sr.ht/~whereiseveryone/guixrus) packages. I had to
disable linting temporarily; as the task took hours to lint not just the
guixrus packages, but also the official guix packages. I'll figure out a way to
select a subset of packages to lint and sent a patch upstream [^1].

- [[PATCH guixrus] ci: disable linting temporarily](https://lists.sr.ht/~whereiseveryone/guixrus/patches/30593)

#### hledger

I updated the documentation of installing hledger (for alpine linux) with links
and badges.

- [install: alpine linux](https://github.com/simonmichael/hledger_site/commit/4b1d207996bdf0eb8f695d4a2fb7553e0b04157a)

### Projects

#### harry

I was learning about [OpenSCAD](https://openscad.org) during last month. I was
always interested in designing hardware tools that I can use. OpenSCAD allows
3D parametric design, ideally for non-organic structures/objects.

While learning its language, I wanted to work on a project. I was looking for
simple designs. [My wife](https://dixita.dev) *loves* gardening, so I chose to
design an indoor plant pot for her. It turned out to be great. It took me
a day to learn the language while working on the project.

- [harry](https://git.sr.ht/~dhruvin/harry)

#### builds.sr.ht-reactos

I've been working on builds.sr.ht-reactos to add support for
[ReactOS](https://reactos.org) as a build image for
[builds.sr.ht](https://builds.sr.ht). There are no packaged SSH servers
available for ReactOS. Without an SSH server a CI image is quite incomplete.
Currently, I've been working on compiling [OpenSSH
(portable)](https://github.com/openssh/openssh-portable) to ReactOS. This is
going to be a long term project, as there are many unknowns to it.

#### past projects

I moved all my projects from GitHub to sourcehut. I made *some* of them public.

- [[ARCHIVED] elm-css](https://git.sr.ht/~dhruvin/elm-css)
- [[ARCHIVED] cis194](https://git.sr.ht/~dhruvin/cis194)
- [[ARCHIVED] project-euler](https://git.sr.ht/~dhruvin/project-euler)
- [[ARCHIVED] talk-small](https://sr.ht/~dhruvin/talk-small)
- [[ARCHIVED] builds.sr.ht-minix](https://sr.ht/~dhruvin/builds.sr.ht-minix)

### Conclusion

After a year of using notmuch, I found myself not searching emails *that much*.
I simplified my email setup by just using aerc and mbsync. Earlier, I used to
run scripts to tag incoming emails appropriately, but now I just put them in
folders. I plan to replace task/time warrior with something simpler too.

I felt mostly unproductive in the beginning of this month, so I did some
maintenance on my past projects during that time.

Hoping to be back on track next month. Peace.

[^1]: 2022-04 Status Update: I [fixed]({{< ref "2022-04-status-update#guixrus"
  >}}) the issue.
