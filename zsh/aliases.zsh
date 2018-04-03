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
alias gca='git commit -v -a'
alias gcas='git commit -v -a -S'
alias gc!='git commit -v --amend'
alias gcs!='git commit -v --amend -S'
alias gca!='git commit -v -a --amend'
alias gcas!='git commit -v -a --amend -S'
alias gco='git checkout'
alias gb='git branch'
alias gst='git status'
alias gco='git checkout'
alias gpl='git pull'
alias gfa='git fetch --all'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias git-delete-merged-branch='git branch --merged | ag -v master | xargs git branch -d'

# Vagrant
alias vgst="vagrant global-status"

# Docker
alias docker-stop-all-containers='docker stop $(docker ps -a -q)'
alias docker-remove-all-containers='docker rm $(docker ps -a -q)'

# Node
# Use npm-exec to local binaries
function npm-exec {
  $(npm bin)/$@
}

# macOS X
alias lock='pmset displaysleepnow'

# Utils
alias vim=nvim
alias edit-zshrc="vim $HOME/.zshrc"
alias edit-aliases="vim $HOME/.dotfiles/zsh/aliases.zsh"
alias reload-shell="source $HOME/.zshrc"
alias clip-json="clippaste | jq . -S | tee /dev/tty | clipcopy"
alias mux="tmuxinator"

# fzf history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
    branch=$(echo "$branches" |
  fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
