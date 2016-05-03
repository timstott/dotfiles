# Unix
alias ll='ls -lha'
alias lh='ls -lAh'

# Bundler
alias be='bundle exec'

# Zeus
alias zs='zeus start'
alias zc='zeus console'

# Git
alias git='nocorrect git'
alias gc='git commit -v'
alias gcs='git commit -v -S'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gst='git status'
alias gco='git checkout'
alias gpl='git pull'
alias gfa='git fetch --all --prune'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'

# Vagrant
alias vgst="vagrant global-status"

# Docker
alias docker-stop-all-containers='docker stop $(docker ps -a -q)'
alias docker-remove-all-containers='docker rm $(docker ps -a -q)'

alias edit-zshrc="vim $HOME/.zshrc"
alias edit-aliases="vim $HOME/.dotfiles/zsh/aliases.zsh"
alias reload-shell="source $HOME/.zshrc"
