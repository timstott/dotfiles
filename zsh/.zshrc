# Minimalistic ZSH with pure
# github.com/sindresorhus/pure
fpath=("$HOME/.zfunctions" $fpath)
autoload -U promptinit; promptinit
prompt pure

# Emacs mode
bindkey -e

export EDITOR=nvim

export PATH=$HOME/.cargo/bin:/usr/local/bin:$PATH

for file in $HOME/.zconfig/*.zsh; do
  source "$file"
done

autoload -Uz compinit
compinit
