---
title: "2022-05 Status Update"
summary: Updates about work on go-midi, and builds.sr.ht.
date: 2022-06-01T00:00:00+05:30
categories:
- status-update
tags:
- alpine
- sourcehut
- midi
---

### Contributions

#### builds.sr.ht

[alpine-conf](https://gitlab.alpinelinux.org/alpine/alpine-conf) is now
accepting timezone as an arg, instead of a flag (from commit
[3b793bb](https://gitlab.alpinelinux.org/alpine/alpine-conf/-/commit/3b793bb78518908eccccebf9a5943bceb4eb449b)).
This broke the edge build of alpine image of builds.sr.ht; which I fixed.

I was figuring out a way to show code metrics of one of my go modules. I
proposed a feature to be added to builds.sr.ht in detail, which got rejected
due to the complexity involved in its implementation and its narrow scope.

- [[PATCH builds.sr.ht] alpine: run setup-timezone conditionally](https://lists.sr.ht/~sircmpwn/sr.ht-dev/patches/32365)
- [[RFC] Build Attributes](https://lists.sr.ht/~sircmpwn/sr.ht-discuss/%3CCKACI3MZHCYH.36RI4SI29KL2C%40hp%3E)

#### wlgreet

I tried packaging [wlgreet](https://git.sr.ht/~kennylevinsen/wlgreet) for
alpine linux. But it was failing at runtime with segfaults. It is written in
rust and uses [wayland-rs](https://github.com/Smithay/wayland-rs). I wasn't
familiar enough with it to be able to fix the issue. I published my work for
others to pick up.

- [testing/wlgreet: new aport](https://gitlab.alpinelinux.org/dhruvin/aports/-/commit/49be7998e8515266494a4a1f65964a3e91da3190)

### Projects

#### go-midi

I worked on this [project](https://sr.ht/~dhruvin/go-midi) whole month.
Exploring various designs that optimize for performance while still exposing a
*pleasant to work with* public API. Since I want to dive deep into how the
library works, I think posts explaining it are better suited as a separate
series.

To give an overview, go-midi has:

- minimum possible memory allocations
- zero heap allocations on hot code paths
- every input typed and validated
- all serialized MIDI messages spec compliant
- no bounds checks
- most functions inlinable by the compiler

Support for MIDI 2.0 is planned but is not yet implemented.

I'll also write a separate post about MIDI 2.0 and how I think it will change
the future of digital music.

### Conclusion

I came to know about [FSCI](https://fsci.in) from a fellow Free Software Hacker
[Sai Karthik](https://kskarthik.gitlab.io). I was pleasantly surprised to see
many people from India sharing similar values about software freedom. If you're
interested knowing more or sharing something interesting, do join us.

I started using [swaylock](https://github.com/swaywm/swaylock) and
[swaylockd](https://github.com/jirutka/swaylockd) to lock my laptop when I'm
away. If you're wondering why I wasn't using a screen-lock all this time,
you're not alone.

A friend of mine, [Chintan](https://chintanacharya.dev), brought his MIDI
keyboard last week and we jammed using
[fluidsynth](https://www.fluidsynth.org/) and [pipewire](https://pipewire.org).

I felt quite productive this month. I tinkered with [several
prototypes](https://git.sr.ht/~dhruvin/go-midi/refs) of go-midi; learned a lot
about go's garbage collection, escape analysis, bounds check elimination, code
generation, and code inlining. Last month's vacation has played a huge role in
this increased productivity.

Until next post. Peace.
