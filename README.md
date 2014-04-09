# dotfiles

## Requirements

[Homebrew](http://brew.sh/) package manager for OS X

    brew bundle

Set zsh as your login shell:

    chsh -s $(which zsh)

## Install

Clone repository:

    git clone git://github.com/timstott/dotfiles.git

Install [rcm](https://github.com/thoughtbot/rcm):

    brew bundle

Install:

    rcup -d dotfiles -x README.md -x LICENSE

This will create symlinks for config files in your home directory. The
`-x` options, which exclude the `README.md` and `LICENSE` files, are
needed during installation but can be skipped once the `.rcrc`
configuration file is symlinked in.

You can safely run `rcup` multiple times to update:

    rcup

# What's in it?

## ZSH

### Aliases

* `be` - `bundle exec`
* `ss` -  `spring stop`
* `git-churn` to show churn for the files changed in the branch.
* `rake` is `zeus rake` if using [Zeus](https://github.com/burke/zeus) on the
  project in current directory.
* `tat` to attach to tmux session named the same as the current directory.
* `v` for `$VISUAL`.

## Git

### Aliases
`st` status
`br` branch
`co` checkout
`ci` commit


## Vim - configuration:

Plugin management though [Vundle](https://github.com/gmarik/vundle)

* [Solarized color scheme](https://github.com/altercation/vim-colors-solarized).
* [Ctrl-P](https://github.com/kien/ctrlp.vim) for fuzzy file/buffer/tag finding.
* [syntastic](https://github.com/scrooloose/syntastic) for syntax checking.
* [Rails.vim](https://github.com/tpope/vim-rails) for enhanced navigation of Rails file structure
* [RSpec](https://www.relishapp.com/rspec) specs from vim.
* [Exuberant Ctags](http://ctags.sourceforge.net/) for tab completion.
* [Ag](https://github.com/ggreer/the_silver_searcher) instead of Grep when available.
* Syntax highlighting for CoffeeScript, Textile, Cucumber, Haml, Markdown, and HTML.

Custom Vim configuration kept to a minimum.

MapLeader `space`
ESC `jj`

### File navigation

`leader leader` Switch between the last two files

`leader n` NerdTree toggle

### Search and replace

## Tmux

* Improve color resolution.
* Remove administrative debris (session name, hostname, time) in status bar.
* Set prefix to `Ctrl+a` (like GNU screen).
* Soften status bar color from harsh green to light gray.
* Vi like bindings
* System clipboard integration

## Powerline

Vim and Tmux have configuration for the [new
powerline](https://github.com/Lokaltog/powerline)


## Credits

tmux
Great book by Brian P. Hogan, [tmux: Productive Mouse-Free Development](http://pragprog.com/book/bhtmux/tmux)

Thoughtbot [dotfiles](http://github.com/thoughtbot/dotfiles)

Thanks to my mentors and community for your support and inspiration.
