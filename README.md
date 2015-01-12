# .files :rocket:

Malgomation of dotfiles goodness.

## Requirements

[Homebrew](http://brew.sh/) package manager for OS X

    brew bundle

Set zsh as your login shell:

    chsh -s $(which zsh)

## Install

Clone repository:

    git clone git://github.com/timstott/dotfiles.git && cd dotfiles
    rake install

## ZSH

### Ruby

* `be` - `bundle exec`
* `zs` - `zeus start`
* `zc` - `zeus console`

## Git

* `git st` or `gs` - status
* `git br` or `gb` - branch
* `git co` - checkout
* `git ci` - commit
* `grbc` - rebase continue
* `grba` - rebase abort

## Vim

Plugin management with [Vundle](https://github.com/gmarik/vundle)

* [Solarized color scheme](https://github.com/altercation/vim-colors-solarized).

* Navigation - CtrlP

MapLeader `space` or sometimes `comma` (because WIP)
ESC ``

### File Navigation

* `Ctrl-p` - CtrlP
* `leader-b` - CtrlP in buffer mode
* `leader-nd` - toggle NERDTree drawer
* `Ctrl-\` - Show current file in NERDTree

### Search/Code Navigation

* `K` - Search the current word under the cursor and show results in quickfix window
* `leader-gg` - Grep command line, type between quotes. Uses Ag Silver Searcher
* `leader-mc` - mark this word for MultiCursor (like sublime). Use `Ctrl-n` (next), `Ctrl-p` (prev), `Ctrl-x`(skip) to add more cursors, then do normal vim things like edit the word

### Rails & Ruby

* `leader-gcp` - Grep Current Partial to find references to the current view partial

### Utility

* `leader-aa` - align things (type a character/expression to align by, works in visual mode or by itself)
* `leader-w` - strip trailing whitespaces

## Tmux

* Set prefix to `Ctrl-a` (like GNU screen)
* Vimization
* System clipboard integration

## Credits

[tmux: Productive Mouse-Free Development](http://pragprog.com/book/bhtmux/tmux) Brian P. Hogan

Thoughtbot [dotfiles](http://github.com/thoughtbot/dotfiles)
YADR [dotfiles](https://github.com/skwp/dotfiles)

Thank you to the community for your support and inspiration.
