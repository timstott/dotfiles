# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
# @source robbyrussell/oh-my-zsh/blob/ccd02866f67e704cd4844029c0f5787c0714e21c/lib/git.zsh
function git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

# Interactive commit finder
function git_interactive_commit_finder() {
  git log --color=always -n 50 --pretty=format:'%C(magenta)%h %d%Creset %s' \
    | fzf --ansi --no-sort \
    | awk '{ print $1 }'
}

function git_interactive_branch_delete() {
  local branches branch
  branches=$(git branch) &&
  selected_branches=$(echo "$branches" | fzf -m) &&
  git branch -D $(echo $selected_branches | tr -d '\n')
}

# Interactive branch checkout
function gci {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") || return
  branch=$(
    echo "$branches" \
      | fzf --no-multi \
            --ansi \
            --preview-window=65% \
            --preview="git log --color=always --max-count 30 --pretty=format:'%C(magenta)%h%Creset %s %Cgreen%an%Creset' {}"
  ) || return
  git checkout "$branch"
}

alias gc='git commit '
alias gcs='git commit -S'
alias gca='git commit -a'
alias gcas='git commit -a -S'
alias gc!='git commit --amend'
alias gcs!='git commit --amend -S'
alias gca!='git commit -a --amend'
alias gcas!='git commit -a --amend -S'
alias gcan!='git commit -a --no-edit --amend'
alias gco='git checkout'
alias gcm='gco master'
alias gb='git branch'
alias gst='git status'
alias gpl='git pull'
alias gfa='git fetch --all --tags'
alias ggpush='git push origin $(git_current_branch)'
alias ggpull='git pull origin $(git_current_branch)'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i $(git_interactive_commit_finder)^'
alias grbm='git rebase -i origin/master'
alias gd='git diff'
