---
title: SIGCONT
date: 2023-07-03T00:00:00+05:30
categories:
- misc
---
I took a _decent_ break of 8 months to recover from a burnout. Here's the story
leading to the burnout and a quick recap of what I did during my break:

### Time

Since I don't work in a _conventional_ way (i.e. for money), I regularly have
to assess whether the time I spend on learning something is in check or not. I
often spend days, if not months, learning something new. This is what I enjoy
the most. It's what makes me tick. Sadly, once I find something more
interesting or challenging to work on, I end up abandoning what I previously
was working on. I manage to pick up those abandoned projects eventually, but
these _context switches_ are something I have to deal with every day. I also
find myself working on remotely related projects because _I must do everything
right_. I had to take some time off to limit where and how much of my time do I
spend on exploring new things.

> Coming from an expert yak shaver: To shave a yak well, you first need to
> learn...

### Opinions

I have opinions. A lot of them. This is partly because I invest a lot of my
time into studying a subject before forming opinions about it. I used to not
hesitate opining in public spaces. But this had lead me to very unpleasant
conversations, about highly polarizing subjects (like politics and religion).
Unfortunately, those conversations end with little to no impact on the views of
conversing parties. I rarely see people change their beliefs in the light of
newly discovered evidence and I really try hard to not do that; but I admit I
often fail.

People with varying backgrounds will have varying outlooks on life. I certainly
don't want to be in the business of convincing people _what I think is right_.

> Put the words "right", and "belief" together, and you're starting a cult.

### Productivity

I had been feeling less productive gradually for some months. I often find
myself making and correcting the same mistakes in the name of my _developer
preferences_.

To fight this, I started valuing correctness, reliability, performance, and
efficiency, more than I value velocity and development experience. I think this
makes me highly unemployable in this fast paced software development world.
I'll focus working on projects that help me implement aforementioned values in
my own work.

> Perfect is enemy of good. But is your good, good enough?

### Recap

#### alguix

I have archived alguix as I don't work on guixrus.

#### alpine

I stopped packaging new software but kept maintaining existing ones. Upon my
request, fellow alpine maintainers took over some of my packages. I now run
alpine latest-stable on all of my devices.

#### builds.sr.ht-guix

I handed over the maintainership of builds.sr.ht-guix to jgart and
unmatched-paren. They are the ones who co-maintain guixrus channel, and
whereiseveryone community. guixrus project is the biggest consumer of the build
image.

#### d6

I started working on s6 utilities under an umbrella project called d6.
Currently, it hosts an s6-metrics exporter and ucspi server.

#### git.dhruvin.dev

I self-host a cgit server now, and all my projects will live there.

#### guixrus

I stopped using guix a long time ago. I revoked my maintainership of guixrus. I
really enjoyed working with whereiseveryone community and on guixrus.

#### justified-dependencies

I worked on a project that was supposed to help web developers decide whether
adding an external dependency is justified by its code usage. This was
different than using something like webpack-bundle-analyzer, wherein you're
mostly interested in understanding your bundle and its interaction with its
dependencies. I later stopped working on it because bundlers don't demarcate
the end of source mapping. It's a complicated issue and even all web browsers,
and various sourcemap inspectors I've used, suffer from this.

#### mcl

I wanted to learn namespaces and container groups (what powers docker) while
working on a project. During my break I often played minecraft, so I developed
a shell script that launched minecraft (bedrock edition) in a crun container
atop ubuntu lts. I later archived it as I no longer use it.

#### mcup

I wrote a minimal zero-dependency rust program to check minecraft bedrock
server status using unconnected ping. I wrote it to learn how to employ zero
runtime memory allocation. This was harder to do without stackalloc dependency.

#### meilisearch

I hosted a meilisearch server in a private network and added the ifsc and
pincode datasets to it. This was a venture in self-hosting a search engine. It
works great and the results are returned within few milliseconds.

#### moar-midi

This project saw another overhaul in its design. I think I'll perpetually
design this _best_ midi library. No ETA.

#### riscv

I went back to square one, and started exploring what I can do next that makes
me happy. Of very few things I'm good at, software development is what I enjoy
the most. I always wanted to study the abstractions atop which we run software.
I bought Computer Organization and Architecture book (for RISC-V). I really
enjoyed reading it. It took me a couple of months to complete the book and
exercises. I am yet to re-read it to make sure I understood the concepts well.
I really like how they designed the architecture and I can understand why
certain trade-offs were made; the authors elaborate this well.

While learning riscv I completed a few projects:

##### bootloader

I wrote a toy bootloader initially in riscv assembly, then in C, and eventually
in, you guessed it, rust (+ inline assembly).

##### unikernel: hello world server

I wrote a unikernel hello world server in rust. Contrary to my prior belief,
writing bare-metal software in rust was quite pleasant experience.

#### rust

I invested good amount of time learning rust testing, and benchmarking tools. I
believe that programming in rust now aligns more with my values than any other
language.

#### s6

I moved all of my (system and user) services from OpenRC to s6, and
s6-rc. While transitioning, I learned parts of strace and lsof to be able
to debug live processes.

#### scriptosaurust

I've been using my laptop for about 10 years now. As my cpu fan is giving up on
me; I need to make sure the cpu doesn't overheat. I added temperature zones to
my status-bar using sysfs. While I was at it, I added battery charge and status
indicator as well.

### What's Next

I'll invest more time and efforts into learning and sharing my knowledge about
rust and riscv. I'm quite interested embedded devices and servers. As I don't
have a riscv device I'll mostly tinker with qemu and spike. I'm saving to buy
next riscv workstation (milkv or p550 from sifive). Stay tuned for more posts
about them in future.
