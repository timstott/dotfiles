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

### Aliases

* `be` - `bundle exec`

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

MapLeader `space`
ESC ``

### Navigation

* `Ctrl-p` - CtrlP

### File Navigation

* `leader-nd` - toggle NERDTree drawer
* `Ctrl-\` - Show current file in NERDTree

### Search and replace

## Tmux

* Set prefix to `Ctrl-a` (like GNU screen)
* Vimization
* System clipboard integration

## Credits

[tmux: Productive Mouse-Free Development](http://pragprog.com/book/bhtmux/tmux) Brian P. Hogan

Thoughtbot [dotfiles](http://github.com/thoughtbot/dotfiles)
YADR [dotfiles](https://github.com/skwp/dotfiles)

Thank you to the community for your support and inspiration.
