export PATH="$HOME/.yarn/bin:$PATH"

# Use npm-exec to local binaries
function npm-exec {
  $(npm bin)/$@
}
