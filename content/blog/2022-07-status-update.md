---
title: "2022-07 Status Update"
summary: >
  Updates about work on alpine packages, experiment with apparmor and
  s6, and public self-hosting.
date: 2022-08-01T00:00:00+05:30
categories:
- status-update
tags:
- alpine
- apparmor
- s6
- self-hosting
---

### Website

#### Experiments

This month, I've started writing about the [experiments]({{< ref "#experiments"
>}}) I do with various FLOSS software. There won't necessarily be a meaningful
outcome of this section. But with this section, I hope to inspire others to
tinker with FLOSS software, and publish their experiences as well. It'll be
home to topics that can't be expanded to long form articles.

### Contributions

#### alpine

##### sphinx-click

Updated [sphinx-click](https://pypi.org/project/sphinx-click/), a build
dependency of todoman, to v4.3.0. I missed updating this project since
[upstream](https://github.com/click-contrib/sphinx-click) stopped publishing
GitHub Releases after v3.0.2. Tracking upstream updates of [packages that I
maintain](https://pkgs.alpinelinux.org/packages?name=&branch=edge&maintainer=Dhruvin+Gandhi)
became tedious. This motivated me to use
[release-monitoring](https://release-monitoring.org). They support notifying
alpine's (among various distributions') package maintainers about upstream
updates. I no longer have to subscribe to the project release feeds of packages
that I maintain.

##### hledger

Updated hledger packages to
[v1.26.1](https://hledger.org/release-notes.html#2022-07-11-hledger-1261).
`abuild` provides `abump` script that makes package updates easier. I wrote
abump-haskell that updates `cabal.project.freeze` file before bumping the
package version. With this, the package definition updates are now completely
automated.

##### hledger-web

I fixed an issue where newly installed hledger-web-openrc service couldn't
create `~hledger/.hledger.journal` file on startup due to a misconfigured
`adduser` command in the `hledger-web.pre-install` script. Contributing to
alpine linux has been such a pleasant experience due to psykose's review(s).
Thanks psykose!

##### font-teluguvijayam

[Karthik](https://kskarthik.gitlab.io) suggested me to package [Telugu Vijayam
Fonts from Silicon Andhra](https://fonts.siliconandhra.org) for alpine linux.
This was a tricky one. Upstream does not provide a convenient tarball to use,
so I had to fetch and checksum every single font. The fonts are packaged and
are available from testing repository. But I asked upstream about the issue and
am awaiting their response.

#### abuild

I recently started [tinkering]({{< ref "#apparmor" >}}) with
[apparmor](https://www.apparmor.net) profiles. While trying to package those
profiles for the alpine packages I maintain, I realized that I could add
support for apparmor in abuild, allowing all alpine package maintainers to
benefit from it. (alpine uses `abuild`, i.e. alpine build tools, to build
packages).

I drafted a proposal and corresponding MR about it. With this change, any
alpine packager can place apparmor profiles in `$pkgdir/etc/apparmor.d` and
have `$pkgname-apparmor-profile` package created automatically. Which then will
be installed along with `$pkgname` if the users have `apparmor-profiles`
package installed already. It may sound complicated, but it really isn't, once
you get to use it.

This proposal was submitted around the end of the month. Stay tuned for next
month's updates.

#### links

- [testing/py3-sphinx-click: upgrade to 4.3.0](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/36644)
- [testing/hledger\*: upgrade to 1.26.1](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/36694)
- [testing/hledger-web: create home directory](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/36902)
- [testing/font-teluguvijayam: new aport](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/36914)
- [Draft: abuild.in: add default function for apparmor profiles](https://gitlab.alpinelinux.org/alpine/abuild/-/merge_requests/154)

### Projects

#### self-hosted

I recently started hosting internet services for my friends and family.
Currently, the instance is hosting a DNS service, with DNSSEC support; and
a mumble server, with automatic certificate renewal; protected by awall. The
instance has its own [status page](https://status.quintet.in) to track. I've
been privately hosting several services for years. I recently got more
unused hardware to play with, and I'm going to put them to good use.

Everything on that instance is configured with care and I hope to start a
series about it soon&trade;. I intend to create high quality guides. It takes a
lot of time, and research to write them. I have started giving dedicated time
working on documenting experiments and writing guides. As they say, *some
soon&trade;s are sooner than other soon&trade;s*.

### Experiments

#### apparmor

I experimented with adding [apparmor](https://www.apparmor.com) profile to
[hledger-web alpine package](https://pkgs.alpinelinux.org/packages?name=hledger-web&branch=edge).

During packaging apparmor profile, I got to use some advanced concepts of
APKBUILDs. When one installs hledger-web package on their system from testing
repo, they will also get the hledger-web-apparmor-profile package installed if
they already have apparmor-profiles package installed. Each package that
provides apparmor profile will be automatically managed by apk this way.

If you develop software that are distributed to your users, please provide an
apparmor profile; possibly write one with help from your package maintainers.
Together, we can make your software more secure.

- [testing/hledger-web: add apparmor subpackage](https://gitlab.alpinelinux.org/dhruvin/aports/-/commit/1c7327295d5f4ff3727d71987eeb06c3b0a8ddea)

#### s6-rc

While I was at experimenting with new alpine software, I thought to package
[s6-rc](https://skarnet.org/software/s6-rc/) service for hledger-web. Writing a
service definition is quite simple in s6. Simple, but different. There's no
single configuration file you write (as in with other init systems). You create
a service directory with necessary files in a specific structure, and let
s6-rc-compile process it to derive a service database, which is said to be
efficient. The s6 service structure is quite API friendly, as opposed to being
user friendly. There will be some time until s6rc can come to alpine
officially, but there's growing community interest. Upstream is working on
user-friendly frontend to create s6 services.

### Conclusion

I'll resume working on hledger projects, and moar-midi next month. Being able
to work on anything is both boon and bane. I find it harder to strike balance
between working on new projects and completing already started ones.

Near the end of the month I got introduced to azadMaidan Project by
[GN](https://www.gnowledge.org/). The project is about hosting popular
federated and decentralized services. Think of it as a suite of FLOSS
collaborative services. I will write more about the project in future.

Until next time. Peace.
