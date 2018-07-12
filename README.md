<h1 align="center">
  .files :rocket:
  <br />
  <img src="https://img.shields.io/badge/editor-neovim-green.svg">
  <img src="https://img.shields.io/badge/shell-zsh-blue.svg">
</h1>
<p align="center">Packages and configuration to make a machine feel like home</p>

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

# install packages
./mac

# symlink dotfiles
./symlink_dotfiles
```

### iTerm2 Setup

- Change font to `Droid Sans Mono for PowerLine` located in [fonts](fonts) directory
- Change theme to `Solarized Dark` located in [iterm2](iterm2) directory

## NeoVim

Mnemonic key bindings inspired by Spacemacs

`<SPACE>`- MapLeader

### Project/File

| binding      | description                                  |
| -            | -                                            |
| `<leader>pa` | open alternate file                          |
| `<leader>ps` | project search                               |
| `<leader>pS` | search project with word under cursor        |
| `<leader>pf` | find file                                    |
| `<leader>pt` | open project tree                            |
| `<leader>pl` | open project tree at current buffer location |

### Buffers

| binding      | description         |
| -            | -                   |
| `<leader>q`  | quit buffer         |
| `<leader>bd` | delete buffer       |
| `<leader>bb` | find opened buffers |
| `<leader>w`  | write buffer        |

### Formatting

| binding | description                                                                               | example |
| -       | -                                                                                         | -       |
| ga      | interactively align visual selection [:link:](https://github.com/junegunn/vim-easy-align) | `vipga` |

### Miscellaneous

| binding | description            |
| -       | -                      |
| `vv`    | vertical split         |
| `ss`    | horizontal split       |
| `//`    | clear highlight search |

## Tmux

* Bind key `Ctrl-a` (like GNU screen)
* Vi navigation
* Preserve current directory on splits

## Git

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

- [tmux: Productive Mouse-Free Development](http://pragprog.com/book/bhtmux/tmux) Brian P. Hogan
- Thoughtbot [dotfiles](http://github.com/thoughtbot/dotfiles)
- YADR [dotfiles](https://github.com/skwp/dotfiles)
