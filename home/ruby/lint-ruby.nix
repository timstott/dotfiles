{ pkgs ? import <nixpkgs> {}, ... }:

pkgs.writeShellScriptBin "lint-ruby" ''
  files="$(
    ${pkgs.git}/bin/git diff \
      --name-only \
      --relative \
      --diff-filter="AM" master \
      -- '*.rb' ':(exclude)db'
    )"

  echo "$files" | ${pkgs.coreutils}/bin/tr " " "\n"

  rubocop --force-exclusion $files $@
''
