# Source .env file when available

source_dotenv() {
  if [[ -f .env ]]; then
    source .env
  fi
}

add-zsh-hook chpwd source_dotenv
