export NVM_DIR="$HOME/.nvm"

# Load node version manager CLI (fast) wihout loading a node version(slow)
# thanks to `--no-use`.
[ -s "$NVM_DIR/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh" --no-use

export PATH="$HOME/.yarn/bin:$PATH"

# Use npm-exec to local binaries
function npm-exec {
  $(npm bin)/$@
}
