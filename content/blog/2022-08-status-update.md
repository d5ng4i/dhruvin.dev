---
title: "2022-08 Status Update"
summary: >
  Updates about work on guixrus, alpine packages, alguix, and experiments
  with tree-sitter and s6-alpine.
date: 2022-09-01T00:00:00+05:30
categories:
- status-update
tags:
- alpine
- guixrus
---

### Contributions

#### aports

I've crafted neovim configuration with minimal plugins. Previously, I used
[packer.nvim](https://github.com/wbthomason/packer.nvim) (neovim package
manager) before. This time, I used alpine as neovim package manager. I packaged
[Comment.nvim](https://github.com/numToStr/Comment.nvim), and
[LuaSnip](https://github.com/L3MON4D3/LuaSnip), and
[friendly-snippets](https://rafamadriz.github.io/friendly-snippets/), to use
them in my setup.

#### guixrus

guixrus has about 1000 packages now, and the lint stage emits numerous lint
warnings that are better handled before the commits are created. The log has
gotten so large, that no one reads it. Disabling it will save compute power. So
I removed the lint task and proposed moving its function to a pre-commit hook.

Months ago, I [created doug]({{< ref "2022-01-status-update#doug" >}}) for
guixrus. At that time, guixrus' website was built using jinja templates which
needed channel metadata in json format. The website since moved to using
home-brew guile program which made doug no longer needed. So I cleaned up
guixrus' website's dependencies and build tasks.

#### links

- [ci: remove lint task](https://git.sr.ht/~whereiseveryone/guixrus/commit/ba8625b0a79bd688dd1b4bd34082f2838b8a17b3)
- [testing/nvim-comment.nvim: new aport](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/37538)
- [testing/nvim-luasnip: new aport](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/37541)
- [testing/friendly-snippets: new aport](https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/37546)
- [[PATCH website] remove no-longer-needed dependencies](https://lists.sr.ht/~whereiseveryone/public-inbox/%3C20220817100559.16513-1-contact%40dhruvin.dev%3E)

### Projects

#### doug

doug was created to allow guixrus build its website using jinja. As the project
is [not needed anymore]({{< ref "#guixrus" >}}), I am archiving it.

### Experiments

#### tree-sitter

I was reading about [tree-sitter](https://tree-sitter.github.io/tree-sitter/)
and configuring it for neovim. I wanted to know more about it. So I decided to
write a grammar for the `/etc/network/interfaces` file. Since I use
[ifupdown-ng](https://github.com/ifupdown-ng/ifupdown-ng), I went with its
dialect. While working on the project, I learned about operator precedence and
associativity, in the context of disambiguating the grammar. The grammar is
mostly complete.

- [tree-sitter-interfaces](https://git.sr.ht/~dhruvin/tree-sitter-interfaces)

#### alguix

I contribute to both guix and alpine and I wanted to bring them together
somehow. I tried building guix (package manager) from source for
`x86_64-unknown-linux-musl` but it required a lot of patching. guix is a
self-contained package manager. So to work-around aforementioned problem, I
packaged pre-built binary version of guix and hosted it as a package offered by
alguix.

[alguix](https://git.sr.ht/~dhruvin/alguix) is an alpine package repository I
host, that provides guix packages that cannot be upstreamed. Note that this
project will remain experimental.

#### s6-alpine

Continuing my experiments with s6, I've started working on custom alpine
VM image with s6. It will have
[s6-linux-init](https://www.skarnet.org/software/s6-linux-init) as /sbin/init
(instead of busybox init), and [s6-rc](https://www.skarnet.org/software/s6-rc)
as service manager (instead of [OpenRC](https://github.com/OpenRC/openrc)).

### Conclusion

I have started committing more time in crafting my
[dotfiles](https://git.sr.ht/~dhruvin/dotfiles). More time but less complexity.
Feel free to remix it with your setup.

I rotated my GPG and SSH keys this month. Older keys will still work for about
a year. I have moved away from using rsa (4096) keys in favor of ed25519. You
can find my latest public keys [here](https://dhruvin.dev/public-key.asc) or
you can locate them with gnupg:

```shell
gpg --locate-keys contact@dhruvin.dev
```

I've been getting excessive requests to my self-hosted server from a couple of
countries (the usual ones). I initially
[hardened](https://git.sr.ht/~dhruvin/self-hosted/commit/60796605ae9d45a3c910171e37485c88b56a5007)
the openssh server configuration, but soon replaced it with
[tinyssh](https://tinyssh.org) after I started using ed25519 keys everywhere.

So far, I've been able to setup [zitadel](https://zitadel.com) and
[nextcloud](https://nextcloud.com) (with
[cert-manager](https://cert-manager.io) and [traefik](https://traefik.io)) for
Azad Maidan. The project is in its infancy, but you can explore it
[here](https://codeberg.org/azad-maidan/azad-maidan). I intend to get v0.1 out
before October.

If you were a regular reader of this blog, you'd see that my contributions to
guix has decreased gradually over past few months. I've been using alpine
for a while now. I love the fact that upstreaming packages to alpine doesn't
take weeks, if not months. Packaging software for alpine is quite easy as well.
Try it in a VM/container, if you haven't already. It's already great for
servers and raspberry pi and it's getting better for desktops.

Until next post. Peace.
