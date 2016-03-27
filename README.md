# .files :rocket:

Malgomation of dotfiles goodness.

## Requirements

* zsh as your login shell: `chsh -s $(which zsh)`

## Install

Clone repository:

    git clone git@github.com:timstott/dotfiles.git .dotfiles && cd .dotfiles
    rake brew
    rake install

## Terminal

iTerm2 install via HomeBrew Cask

* Font: Droid Sans Mono for PowerLine in `fonts`
* Color scheme: Solarized Dark in `iterm2`

## ZSH

### Ruby

* `be` - `bundle exec`
* `zs` - `zeus start`
* `zc` - `zeus console`

### Git

* `git st` or `gs` - status
* `git br` or `gb` - branch
* `git co` - checkout
* `git ci` - commit
* `gfa` - fetch all and prune
* `grbc` - rebase continue
* `grba` - rebase abort

### Docker

 * `docker-stop-all-containers` - stop all running containers
 * `docker-remove-all-containers` - remove all containers

### Vagrant

* `vgst` - global status

### Secrets

Create a secrets dotfile. ` touch ~/.secrets`

## Tmux

* Bind key `Ctrl-a` (like GNU screen)
* Vi navigation
* System clipboard integration

## Vim

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
