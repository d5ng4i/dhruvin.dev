---
title: "2022-06 Status Update"
summary: >
  Updates about work on go-hledger-types, hledger-timeclock, hledger-gst,
  hledger alpine packages, guix, minecraft-alpine, and a rust port of go-midi.
date: 2022-07-01T00:00:00+05:30
categories:
- status-update
tags:
- alpine
- guix
- hledger
---

### Contributions

#### alpine

##### hledger

[hledger](https://hledger.org) updated to v1.26 with improvements and bug
fixes. I updated dependent alpine packages for the same. I submitted a package
for [hledger-timeclock](#hledger-timeclock).

##### guix

Since I contribute to guix and alpine both, I wanted a convenient way to create
guix packages on alpine. So I tried packaging guix for alpine linux. Alpine
doesn't have many guile packages and there's no support from abuild tools for
it. I packaged all guile dependencies of guix, i.e. guile-gcrypt, guile-gnutls,
guile-sqlite3, guile-zlib, guile-lzlib, guile-avahi, scheme-bytestructures,
guile-git, and guile-json.

guix-daemon required argp from glibc. musl doesn't have it. I used
argp-standalone as a substitute. This allowed me to build guix-daemon
successfully. The documentation could be built easily with (undocumented) po4a
build dependency.

Final missing piece was building guix, i.e. compiling guile scheme code to
guile objects. Unfortunately, this was where I hit the wall. musl libc lacks
the encoding support that guix needs. I was told by people in guix irc room
that trying to port it to musl will be a huge undertaking. Guile can be
bootstrapped from a few KB of binaries (without localization support), I
believed it would be easy to do the same with alpine. But I lost motivation to
continue this work due to some \<unspecified\> reason. I did open-source
everything under the same license as aports, if anyone else is interested in
picking it up. Packaging everything took me about a week and I enjoyed working
on it.

##### links

- [testing/hledger: upgrade to 1.26](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/35107)
- [testing/hledger-timeclock: new aport](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/35135)
- [testing/hledger-interest: upgrade to 1.6.4](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/35136)
- [testing/hledger-stockquotes: upgrade to 0.1.2.1](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/35218)
- [[INCOMPLETE] testing/guix: new aport](https://gitlab.alpinelinux.org/dhruvin/aports/-/commits/guix)

### Projects

#### go-hledger-types

Recently, [my wife](https://dixita.dev) started her own business. We were
looking for ways to manage her finances and time for projects with hourly rate.
We decided to use [hledger](https://hledger.org) to track them. hledger has
good support for tracking time, and calculating amount using auto posting
rules. We wanted to generate invoices and tax returns from hledger. I wanted to
write that in [go](https://golang.org). Since I couldn't find a library that
helps with it, I wrote one.

[go-hledger-types](https://git.sr.ht/~dhruvin/go-hledger-types) is a minimal
library that defines go native types to decode (and encode) ledger data
exported from hledger.

#### hledger-timeclock

hledger as good time tracking support. But it doesn't have commands to clock-in
and clock-out. There are shell aliases suggested by the hledger project. But I
wanted something that supports shell completion.

I developed [hledger-timeclock](https://git.sr.ht/~dhruvin/hledger-timeclock).
It is an hledger addon that allows one to track time as they would with
existing time tracking software. You clock in before you start work, you clock
out when you're done. It comes with shell completion to make clocking in and
out easier for users.

#### hledger-gst

Note: This section (and project) is only related to [Goods and Services Tax of
India](https://gst.gov.in).

For small businesses offering services only to a few clients, filing GST is
quite easy and simple. You add your sales every month using their portal, and
the rest is generated automatically. Although, as the number of transactions go
up, you need to enter more data; meticulously. They (Goods and Services Tax
Network) offer offline utilities that help with this, but they only support
Windows.

We both have been using GNU/Linux for years, and installing or using Windows
just to file taxes didn't quite sit well. My wife is using hledger to maintain
her business ledger. Developing something that helps her generate monthly GST
return from hledger came naturally to me.

[hledger-gst](https://git.sr.ht/~dhruvin/hledger-gst) generates GSTR-1 for a
specific month, given the template and a ledger. The work has just started, and
I intend to complete it by the end of next month.

#### minecraft-alpine

I used to play Minecraft with friends before. There was a custom launcher for
Minecraft Bedrock in flathub. Due to some (still) unknown reason it doesn't
launch the game on Alpine anymore. I tried packaging it for alpine linux as a
separate alpine repo. Unfortunately (for me), it uses bionic APIs and requires
\<some\> functions from glibc; which are absent in musl. I am not motivated
enough to port it to musl. Minecraft was great while it lasted.

#### moar-midi

Last month I [shared]({{< ref "2022-05-status-update#go-midi" >}}) that I was
working on [go-midi](https://sr.ht/~dhruvin/go-midi/). During my unending fight
with the go compiler to make minimal heap allocation, I thought to port it to
rust. To try it out, I wrote a macro that derived methods of MIDI messages.
I'll explore various designs before finalizing one next month. Rust seems a
good candidate for my needs. Will see how it goes.

### Conclusion

I did not post about go-midi because I was working on porting it to rust. I'll
probably archive go-midi if rust becomes the way to go (no pun intended).

This month, I was in my home state. I visited my college after a long time. It
was pleasant catching up with people there.

I showed my parents [The Social
Dilemma](https://www.netflix.com/in/title/81254224) on Netflix. They said the
movie opened their eyes. I then showed them the [Digital
Wellbeing](https://www.android.com/digital-wellbeing/) section of the Settings
app of their Android phone. Explained what it is and how they can be in charge
of their time. To me, this seems to be a healthy way to show people the good,
the bad, and the ugly of social media.

Until next post. Peace.
