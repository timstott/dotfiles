# keychain
# Documentation https://www.funtoo.org/Keychain

if which keychain > /dev/null; then
  eval $(
    keychain \
      --eval \
      --quiet \
      --agents ssh
    )
else
  YELLOW="\e[33m"
  DEFAULT="\e[0m"
  echo "${YELLOW}keychain not installed${DEFAULT}"
fi
