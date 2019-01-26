# Setting ag as the default source for fzf to respect .gitignore, .agignore
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'

export FZF_DEFAULT_OPTS='--color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254 --color info:254,prompt:37,spinner:108,pointer:235,marker:235'

if which fzf-share > /dev/null; then
  fzf_share_dir=$(fzf-share)
  source "$fzf_share_dir/completion.zsh"
  source "$fzf_share_dir/key-bindings.zsh"
else
  YELLOW="\e[33m"
  DEFAULT="\e[0m"
  echo "${YELLOW}fzf-share not installed${DEFAULT}"
fi
