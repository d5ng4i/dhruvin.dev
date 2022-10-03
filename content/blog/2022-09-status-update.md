---
title: "2022-09 Status Update"
summary: >
  Updates about work on website, gnukhata, alpine packages, sourcehut,
  moar-midi, and experiments with s6-alpine, and execline.
date: 2022-10-03T00:00:00+05:30
categories:
- status-update
tags:
- alpine
- sourcehut
- website
---

I missed writing about my work regularly, so this month's post will mostly be
about what I can recall doing, at the end of the month.

### Website

I have been working on moving the website from [hugo](https://gohugo.io/) to
[zola](https://getzola.org/). Expect major changes in theme and paths next
month. All links to my site will remain accessible after the transition. I'm
going to use Atom for RSS feeds.

### Contributions

#### gnukhata

Simplified the Dockerfile of [gnukhata](https://gnukhata.gitlab.io)'s new SPA
web application.

#### aports

##### nvim-luasnip

I requested upstream to have tagged releases. After discussing about what
versioning scheme to use. They decided to go with [semver](https://semver.org)
and released [v1.0.0](https://github.com/L3MON4D3/LuaSnip/releases/tag/v1.0.0).
Following their release I upgraded the alpine package.

#### sourcehut

##### builds.sr.ht-guix

guix package manager checks out the guix repository when `guix pull` is ran. By
providing cache from host (current image) to guest (newly created image), I
managed to shave off several minutes of build time and bandwidth. It was done
since guix already is too slow to generate image.

This was both too clever, and too stupid of me. guix doesn't seem to be
cleaning up stale files in that git checkout. The cache had been ever growing;
to the point where it has reached about 4GB.

This cache became a problem when newly created qcow2 image was expanding to
contain latest guix checkout. I fixed this issue.

#### links

- [fix(gkapp): simplify Dockerfile](https://gitlab.com/gnukhata/build/-/commit/6aeb0a331556576d75c95239b13a1dd16ece7203)
- [testing/nvim-luasnip: upgrade to 1.0.0](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/38757)
- [images/guix: stop providing cache from host](https://lists.sr.ht/~sircmpwn/sr.ht-dev/patches/35276)

### Projects

#### moar-midi

MIDI protocol involves using many non 8 bit (un)signed integers. For example a
channel is 4 bit unsigned integer, a note is 7 bit unsigned integer, and a
pitch bend change is 14 bit signed integer. I've worked on macros that create
these non 8 bit integers with appropriate impls. I initially used proc-macros
to Derive certain traits. I realised that I did not need the flexibility they
have, so I replaced them with faster and easier (for my use-case) declarative
macros.

Something I missed while working with go is ability to express complex
mathematical properties of aforementioned MIDI units. For example, a channel,
even though represented as a number, cannot be added to another channel to
yield new channel; or a velocity requires saturating arithmetic (if not checked
arithmetic) for all unsigned integral arithmetic. There are many properties
that I just couldn't express with go's type-system. Go is designed this way to
make is simple, and it's not a criticism. It's just deliberate choice that
makes me not have the complier check/verify those properties for me at compile
time.

Enter rust, if you `impl Add<X> for X` then an instance of your type can be
added to another (of the same type). If you `impl Add<X> for Saturating<X>`
then your type allows explicit saturating addition. Almost everything I wanted
the type system to support, can be expressed. Once you overcome the complexity
involved with rust, you'll find yourself be able to encode your requirements
directly into the type system which guarantees that those properties are
checked/verified at compile time, and never during runtime. Creating a library
with sound and correct interfaces requires a lot of time/thought upfront.
Something that I like doing and I think rust makes it easier.

*Hi, I'm a rust shill.*

### Experiments

#### s6-alpine

I managed to get s6-linux-init working on my system. Testing it was breeze with
grub's kernel cmdline. I haven't replaced busybox init yet, I think I'll do it
next month after getting more familiar with s6-linux-init.

#### swaybar-status-command-execline

Recently, I found out about
[execline](https://www.skarnet.org/software/execline/) scripting language from
the author of s6, [Laurent Bercot](https://skarnet.com/).

To try it out, I ported my swaybar-status-command script from posix shell
(`while date -R; do sleep 1; done`) to execline (`loopwhilex foreground { date
-R } sleep 1`).

#### scriptosaurust

I have started porting "quick and dirty" scripts, that ran as processes, to,
you guessed it, rust. Although, I'll only be porting scripts are stable enough,
because prototyping stuff is still faster in shell.

### Conclusion

I was finding it hard to work on
[azad-maidan](https://codeberg.org/azad-maidan) last month. The project needs
more time since it's in its infancy, and I am working on moar-midi and other
projects full-time. If you'd like to work on it, feel free to contact me. The
project uses [Kubernetes](https://kubernetes.io/), [Helm](https://helm.sh/),
[Traefik](https://traefik.io/), [CertManager](https://cert-manager.io/),
[Zitadel](https://zitadel.com/), and [NextCloud](https://nextcloud.com/).

Until next post. Peace.
