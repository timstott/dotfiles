# Setting ag as the default source for fzf to respect .gitignore, .agignore
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'

export FZF_DEFAULT_OPTS='--color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254 --color info:254,prompt:37,spinner:108,pointer:235,marker:235'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
