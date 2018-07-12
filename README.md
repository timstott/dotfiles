# The .files :rocket:

The packages and configuration necessary to make a machine feel like home.

## TOC

- [Installation](#installation)
- [NeoVim](#neovim)
- [Tmux](#tmux)
- [Git](#git)
- [ZSH ](#zsh)
  - [Aliases](#aliases)
  - [Secrets](#secrets)
- [Credits](#credits)

## Installation

```
git clone git@github.com:timstott/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Install CLI tools
./mac

# Symlink dotfiles
./dotfiles

# Optional
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
```

### iTerm2 Setup

- Change font to `Droid Sans Mono for PowerLine` located in [fonts](fonts) directory
- Change theme to `Solarized Dark` located in [iterm2](iterm2) directory

## NeoVim

Mnemonic key bindings inspired by Spacemacs

* `<SPACE>`- MapLeader
* `<leader>pa` - open alternate file
* `<leader>ps` - project search
* `<leader>pS` - search project with word under cursor
* `<leader>pf` - find file
* `<leader>pt` - open project tree
* `<leader>pl` - open project tree at current buffer location
* `<leader>bb` - find opened buffers
* `<leader>w`  - write buffer
* `<leader>q`  - quite buffer

* `vv` - vertical split
* `ss` - horizontal split
* `//` - clear highlight search

## Tmux

* Bind key `Ctrl-a` (like GNU screen)
* Vi navigation
* Preserve current directory on splits

## Git

* Place user config in *~/.gitconfig.user*
* Git hook to re-index ctags post-checkout
* Manually re-index ctags `git ctags`

TIP: Use `git init` in existing repos to copy the hooks

## ZSH

### Aliases

In addition to aliases defined by Oh My Zsh plugins, custom aliases are available.

#### Utilities

* `fh` - search zsh history with fzf
* `clip-json` - prettify JSON clipboard content

#### Ruby

* `be` - `bundle exec`
* `zs` - `zeus start`
* `zc` - `zeus console`
* `rum` - run rubocop with files added or modified since origin/master

#### Git

* `gco` - checkout
* `gst` - status
* `gb` - branch
* `gc` - commit
* `gcs` - sign commit
* `gca` - stage and commit
* `gcas` - stage, sign and commit
* `gc!` - amend and commit
* `gcs!` - amend, sign and commit
* `gca!` - stage, amend and commit
* `gcas!` - stage, amend, sign and commit
* `gfa` - fetch all
* `grbc` - rebase continue
* `grba` - rebase abort

#### Docker

* `docker-stop-all-containers` - stop all running containers
* `docker-remove-all-containers` - remove all containers

#### Vagrant

* `vgst` - global status

### Secrets

Store secret environment variables in `~/.secrets`. The file, when present, is
sourced by *zshrc*.

-------------------------------------------------------------------------------

## Credits

[tmux: Productive Mouse-Free Development](http://pragprog.com/book/bhtmux/tmux) Brian P. Hogan

Thoughtbot [dotfiles](http://github.com/thoughtbot/dotfiles)
YADR [dotfiles](https://github.com/skwp/dotfiles)

Thank you to the community for your support and inspiration.
