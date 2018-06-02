alias vim=nvim
alias mux="tmuxinator"
alias resource-shell="source $HOME/.zshrc"

# Unix
alias ll='ls -lha'
alias lh='ls -lAh'

# Vagrant
alias vgst="vagrant global-status"

# Docker
alias docker-stop-all-containers='docker stop $(docker ps -a -q)'
alias docker-remove-all-containers='docker rm $(docker ps -a -q)'


# Utils
alias edit-zshrc="vim $HOME/.zshrc"
alias edit-aliases="vim $HOME/.dotfiles/zsh/aliases.zsh"
alias clip-json="clippaste | jq . -S | tee /dev/tty | clipcopy"
