alias be='bundle exec'
alias zs='zeus start'
alias zc='zeus console'

chruby_fn=/usr/local/opt/chruby/share/chruby/chruby.sh
chruby_auto=/usr/local/share/chruby/auto.sh

if [ -f $chruby_fn ] && [ -f $chruby_auto ]; then
  source $chruby_fn
  source $chruby_auto
else
  YELLOW="\e[33m"
  DEFAULT="\e[0m"
  echo "${YELLOW}chruby not installed${DEFAULT}"
fi
