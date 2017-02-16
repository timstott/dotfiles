# The .files :rocket:

The packages and configuration necessary to make a machine feel like home.

## TOC

- [Installation](#installation)
- [nvim](nvim)
- [Emacs](#emacs)
- [Tmux](#tmux)
- [Git](#git)
- [ZSH ](#zsh)
  - [Aliases](#aliases)
  - [Secrets](#secrets)
- [~~Vim~~ OUTDATED](#vim-outdated)
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
- Change theme to `Molokai` located in [iterm2](iterm2) directory

## nvim

Mnemonic key bindings inspired by Spacemacs

* `<SPACE>`- MapLeader
* `<leader>pa` - open alternate file

## Emacs

Emacs is configured with Spacemacs (evil), see [spacemacs](spacemacs).

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

#### Ruby

* `be` - `bundle exec`
* `zs` - `zeus start`
* `zc` - `zeus console`

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
* `gfa` - fetch all and prune
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

## ~~Vim~~ OUTDATED

Plugin management with [Vundle](https://github.com/gmarik/vundle)

* [Solarized color scheme](https://github.com/altercation/vim-colors-solarized).

* Navigation - CtrlP

MapLeader `<Space>` or sometimes `comma` (because WIP)
ESC ``

### File Navigation

* `Ctrl-p` - CtrlP
* `leader-b` - CtrlP in buffer mode
* `leader-nd` - toggle NERDTree drawer
* `Ctrl-\` - Show current file in NERDTree

### Search/Code Navigation

* `K` - Search the current word under the cursor and show results in quickfix window
* `leader-gg` - Grep command line, type between quotes. Uses Ag Silver Searcher
* `leader-mc` - mark this word for MultiCursor (like sublime).
   Use `Ctrl-n` (next), `Ctrl-p` (prev), `Ctrl-x`(skip) to add more cursors,
   then do normal vim things like edit the word

### Rails & Ruby

* `leader-gcp` - Grep Current Partial to find references to the current view partial
* `leader-pt` - `puts` selected value or value under the cursor
* `leader-pit` - `puts` inspected selected value or value under the cursor
* `leader-"` `leader-'` `leader-]` `leader-)` `leader-}` - surround a
   word or visual selection in these common wrappers
*  `leader-#` - does #{ruby interpolation}

### Utility

* `leader-aa` - align things (type a character/expression to align by, works 
   in visual mode or by itself)
* `leader-w` - strip trailing whitespaces

### Tips & Tricks

* debug vim keymapping `:verbose map [keycombo]`
* start vim without vimrc `vim -u NONE`

-------------------------------------------------------------------------------

## Credits

[tmux: Productive Mouse-Free Development](http://pragprog.com/book/bhtmux/tmux) Brian P. Hogan

Thoughtbot [dotfiles](http://github.com/thoughtbot/dotfiles)
YADR [dotfiles](https://github.com/skwp/dotfiles)

Thank you to the community for your support and inspiration.
