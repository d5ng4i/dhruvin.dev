---
title: "2021 Year in Review"
date: 2022-02-23T21:50:06+05:30
categories:
- work
series:
- year-in-review
---

Last year, I decided to move away from using proprietary software in favor of
using free, libre, and open-source software. I will share the reasons in a
future post. What entailed that decision is summarised in this one. I divided
the post into 4 parts to help understand the timeline better.

### First Quarter

#### IDE

I write code almost every day and I was quite good with JetBrains IDEs. It was
the single most important software that I couldn't live without. I knew that
moving away from it will have significant impact on my productivity, but I like
to tackle the toughest problem first, so I decided to replace it with
[emacs](https://www.gnu.org/software/emacs/) first.

I continued using my *rusty new* [^1] MacBook Air 2017, with emacs for about
three months. I was becoming good at using emacs. But if you've used emacs,
you'd know that *One does not simply use emacs just to edit code*. I started
replacing other software with what was built into emacs.

#### Software forge

After acquisition of GitHub by Microsoft, I lost interest in hosting my
projects there. I already had an account on GitLab but their reverse proxy
won't allow me to use it via [icecat](https://www.gnu.org/software/gnuzilla/).
I created an account on [sourcehut](https://sourcehut.org/) to host my
projects. But I was actively comparing various software forges to see whether
their model of business aligns with what I was looking for.

### Second Quarter

#### Email client

I had been using [GPGTools](https://gpgtools.org) with Apple Mail for about two
years then. It was a perfect setup for me to be able to communicate with people
privately over email. I replaced it with [notmuch](https://www.notmuch.org/).
Notmuch introduced a different kind of email experience, which grew on me. I
just had purchased a copy of [GPG Mail Support
Plan](https://gpgtools.org/support-plan) before moving to notmuch. I asked the
developers if I could get a refund and they generously processed the refund. I
recommend GPGTools to Apple Mail users.

#### Password manager

I bought a Yubikey and replaced Apple Keychain with
[pass](https://www.passwordstore.org/). I also replaced Authy with
[pass-otp](https://github.com/tadfisher/pass-otp). The only *secure* hardware
key available in India at that time was Yubikey. This made me realize that I
won't be able to move to free software completely. I decided to make compromise
with 3 categories of software.

- Firmware
- Drivers
- Games (Entertainment)

#### Media player

[EMMS](https://www.gnu.org/software/emms/) and [MPV](https://mpv.io/) replaced
QuickTime Player and Apple Music.

#### Everything else

[Org Mode](https://orgmode.org/) replaced Notes, Calendar, Todos, Stopwatch,
Calculator, and Alarm. It's one of the best software I've used.

### Third Quarter

#### Operating System

Everything that had ties to Apple was replaced by emacs. I brought home my 8
year old HP laptop, to replace MacOS with GNU+Linux. I was quite inspired by
[Richard Stallman](https://stallman.org/) at that time (and I still am), so I
decided to run a completely free operating system called [GNU
Guix](https://guix.gnu.org/) on my laptop. I had to buy AR9271 to get wireless
internet connection. Wired connection worked just fine
though.

There were some software that I wanted to use, that weren't there in official guix
channel [^2]. I contributed some of them upstream with the help of guix
community. [#guix on irc.libera.chat](https://guix.gnu.org/en/contact/irc/) is
welcoming and friendly. I learned how the patches are submitted via mailing
lists while contributing to guix. Here are the patches I submitted to guix over
the last year:

- [Add node-global-gradle-clean](https://issues.guix.gnu.org/47269)
- [Add emacs-rustic](https://issues.guix.gnu.org/49273)
- [Add emacs-ripgrep](https://issues.guix.gnu.org/49286)
- [Fix libykpers reference in python-yubikey-manager](https://issues.guix.gnu.org/49342)
- [Update yubikey-manager to version 4.0.3](https://issues.guix.gnu.org/49464)

#### sourcehut

After assessing alternatives for several months, I decided to stay with
sourcehut and make it better by contributing to it. I also started paying for
it to support the project financially.

#### builds.sr.ht-guix

sourcehut lacked support of GNU Guix as a build
image for its CI service. I created a project
[builds.sr.ht-guix](https://sr.ht/~dhruvin/builds.sr.ht-guix) and got it
upstream. I have been
[maintaining](https://man.sr.ht/builds.sr.ht/compatibility.md#guix-system) it
since then. I authored a [mini
cookbook](https://man.sr.ht/~dhruvin/builds.sr.ht-guix-cookbook/) explaining
how guix can be used with builds.sr.ht. The project also got
[featured](https://sr.ht/projects/featured) on sourcehut some time ago.

### Last Quarter

#### builds.sr.ht-minix

I was looking into various non-mainstream operating systems and trying to
figure out a way to make development using them more accessible with sourcehut.
I started creating a CI image for [Minix 3](https://minix3.org/) in
[builds.sr.ht-minix](https://git.sr.ht/~dhruvin/builds.sr.ht-minix/). Minix, at
the stage of development at that time, lacked support of automated build image
creation on GNU+Linux. To work *around* this problem, I wrote an
[expect](https://core.tcl-lang.org/expect/index) script. Which understandably
was turned down by the upstream as it was not really maintainable
for long term.

I tried implementing the same with [NetBSD](https://netbsd.org/) but it too had
no support for minix file system in its kernel. Unfortunately, I had to archive
my project as the Minix 3 project was
[dormant](https://github.com/Stichting-MINIX-Research-Foundation/minix/tags)
for 4 years and the amount of time required to implement it would outweigh the
benefits of a CI image. While working on this project I interacted with people
on #minix and #netbsd on irc.libera.chat. They were friendly and helpful.

#### builds.sr.ht

I implemented support for [accepting build job
note](https://lists.sr.ht/~sircmpwn/sr.ht-dev/patches/27051) as querystring
paramenter because I wanted to provide links to predefined build jobs along
with example build manifests in guix cookbook.

#### builds.sr.ht-guix

GNU Guix had some network issues during this time. Guix CI image is built
nightly, so it had more cases of failure. I made several changes to the CI
image builder that fixed these problems.

#### Alpine linux

Guix is one of the advanced GNU+Linux distros. It has many features but they do
come at a cost, which I won't go into in this post. After exploring and using
GNU Guix, I wanted to explore a minimal distro that *does the job*. I decided to
try [Alpine Linux](https://alpinelinux.org/). Alpine too lacked some packages
that I wanted to use. My experience with packaging software for guix helped
me. Here are the packages I contributed upstream last year:

- [hledger, hledger-ui, and hledger-web](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/28448)
- [hledger-iadd](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/28450)
- [hledger-web-openrc](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/28458)
- [todoman, py3-sphinx-autorun, and py3-sphinx-click](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/28451)

Here is a [link to all
packages](https://pkgs.alpinelinux.org/packages?branch=edge&maintainer=Dhruvin+Gandhi)
that I'm maintaining.

### Summary

I don't use a smartphone. I use a feature phone (Nokia 215) which is turned off
almost all the time. If I were to use a smartphone, I'd have used
[postmarketOS](https://postmarketos.org/).

I like to self-host. This post does not include that journey. I'll publish
another detailed post about it in future.

I started accepting one time and recurring donations. I was relying on
donations for a while until the RBI announced guidelines that stopped all my
recurring donations. I don't (can't) rely on donations anymore, but I'll
appreciate if you'd like to [donate]({{< ref "donate" >}}).


Overall, I think this transition was successful. I don't depend on proprietary
software that might limit my ability to compute in a substantial way.

Since I was (and still am) unemployed last year, I had (and still have) the
luxury of being able to work on whatever I wish to, full-time. I can't thank
[my wife](https://dixita.dev/) enough for encouraging me to do what I do and
financially supporting me.

[^1]: A story for another time.
[^2]: A guix channel is a repository of definitions of software packages. One
  can download pre-built *bit-to-bit identical* binaries from the CI or can
  modify, build, and use the software locally.
