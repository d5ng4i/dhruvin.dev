---
title: "2022-10 Status Update"
summary: >
  Updates about work on alpine packages, guixrus, guix, moar\_midi, and
  experiments with mcpelauncher.
date: 2022-11-05T00:00:00+05:30
categories:
- status-update
tags:
- alpine
- guixrus
- guix
---

I missed writing about my work regularly, again, so this month's post will
mostly be about what I can recall doing, at the end of the month.

### Contributions

#### aports

- [community/hledger\*: upgrade to 1.27.1](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/39979)
- [testing/nvim-luasnip: upgrade to 1.1.0](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/40180)
- [testing/py3-debian: upgrade to 0.1.48](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/40266)
- [community/reuse: move from testing](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/40277)

#### guixrus

- [ci: use hut](https://git.sr.ht/~whereiseveryone/guixrus/commit/648b85a5a9e7cdcdd0165221fea963b9e12c50a3)
- [ci: make pull task mandatory](https://git.sr.ht/~whereiseveryone/guixrus/commit/498c353479dc84d0d9653d0bda031850216bdcb6)
- [ci: simplify pull](https://git.sr.ht/~whereiseveryone/guixrus/commit/548e2a60acc6dc994cc500d3b97ac5f70af65db9)
- [ci: be verbose about scripts/pull errors](https://git.sr.ht/~whereiseveryone/guixrus/commit/973c04a2fc3bba58edd6eac03656d0cbe49ce994)
- [ci: log guix pull errors](https://git.sr.ht/~whereiseveryone/guixrus/commit/da3ca55c182a2d078f1b661f2bbc512b3a72f556)
- [ci: add -o pipefail to scripts/pull](https://git.sr.ht/~whereiseveryone/guixrus/commit/4d00527ca6354ddbed40b347ce697b90bf578738)
- [ci: add -o pipefail to pull task](https://git.sr.ht/~whereiseveryone/guixrus/commit/9c375b7531496b7d383541523126d929548ae918)

#### guix

- [[PATCH 0/2] Update hut to 0.2.0.](https://issues.guix.gnu.org/58395)

### Projects

#### moar\_midi

This month I was mostly invested in moar\_midi. There's a lot to be done for
the library to even be published. The current design has typed primitives and
the messages are already encoded as MIDI packets in memory. This makes sure
that no runtime cost will be incurred for encoding/decoding MIDI messages. The
API is changing quite frequently but the priorities are set:

1. Correctness
2. Performance
3. Convenience

So far, the library uses `no_std` and `forbid(unsafe_code)` to make sure the
interfaces are minimal and sound. Implementations for traits from `std` crate
(e.g. `std::error::Error`; which is unstable in `core` as `error_in_core`) can
be enabled with optional `std` feature.

Many of the rust features I'd like to use with moar\_midi are unstable (e.g.
`core::num::Saturating`, and `const fn core::option::Option::unwrap`). I _wish_
to help make said unstable rust features land in stable rust. The library will
always target latest stable rust.
[MSRV](https://blog.rust-lang.org/2021/10/21/Rust-1.56.0.html#cargo-rust-version)
is not yet decided, but I see value in it.

### Experiments

#### webexts

I packaged a couple of webextensions for alpine in a personal package
repository. This was done to see if another way of extension distribution is
possible, given Google is cracking down on ad-blockers. In the process, psykose
added support for sideloading extensions to firefox in aports. This will allow
any alpine user to sideload extensions should they wish to.

#### mcpelauncher

I tried porting mcpelauncher to alpine. After successfully compiling it, I
found out that it requires 32bit mesa-egl drivers, which requires multilib
support when run on 64bit. Unfortunately, multilib support is absent in musl
libc. The
[mcpelauncher](https://gitlab.alpinelinux.org/dhruvin/aports/-/tree/mcpelauncher)
branch has the latest work-in-progress package definition.

### Conclusion

I self-hosted [kodi](https://kodi.tv/) on a raspberry pi 3b, connected with a
projector. I also set up [prometheus](https://prometheus.io/) and
[alertmanager](https://prometheus.io/docs/alerting/latest/alertmanager/) for
email notifications. I received a lot of emails about instances getting down
due to power-cuts. So, I hosted an IRC server to receive (to be done) alerts in
a designated channel instead.

After writing the post, I feel that I was more productive last month than I
previously thought. This is just me _patting myself on the back_. ;)

Until next post. Peace.
