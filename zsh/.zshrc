# Minimalistic ZSH with pure
# github.com/sindresorhus/pure
fpath=("$HOME/.zfunctions" $fpath)
autoload -U promptinit; promptinit
prompt pure

# Emacs mode
bindkey -e

export EDITOR=vim

alias ls='ls --color=auto'
alias la='ls -lha'
alias ll='ls -lh'
alias path="echo $PATH | sed 's/:/\n/g'"


## Completion

# Enable zsh tab-complition
autoload -Uz compinit
compinit


## History

export HISTSIZE=100000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE              # Enable history
setopt BANG_HIST                       # Treat the '!' character specially during expansion
setopt EXTENDED_HISTORY                # Write the history file in the ":start:elapsed;command" format
setopt HIST_EXPIRE_DUPS_FIRST          # Expire duplicate entries first when trimming history
setopt HIST_FIND_NO_DUPS               # Do not display a line previously found
setopt HIST_IGNORE_ALL_DUPS            # Delete old recorded entry if new entry is a duplicate
setopt HIST_IGNORE_DUPS                # Don't record an entry that was just recorded again
setopt HIST_IGNORE_SPACE               # Don't record an entry starting with a space
setopt HIST_REDUCE_BLANKS              # Remove superfluous blanks before recording entry
setopt HIST_SAVE_NO_DUPS               # Don't write duplicate entries in the history file
setopt HIST_VERIFY                     # Don't execute immediately upon history expansion
setopt INC_APPEND_HISTORY              # Write to the history file immediately, not when the shell exits
setopt SHARE_HISTORY                   # Share history between all sessions
# Additional reading these options https://bit.ly/2Clh6mH

# Complete history with up/down arrows (source: https://bit.ly/2COvZPx)
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search   # Up arrow
bindkey "^[[B" down-line-or-beginning-search # Down arrow


## Miscellaneous

setopt AUTO_CD                         # CD when command is a directory


## Awesomes

for file in $HOME/.zconfig/*.zsh; do
  source "$file"
done
