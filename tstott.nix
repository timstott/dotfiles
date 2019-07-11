{ pkgs ? import <nixpkgs> {} }:
let

in
  [
    pkgs.awscli
    pkgs.coreutils
    pkgs.curl
    pkgs.ctags
    pkgs.git
    pkgs.gnupg
    pkgs.jq
    pkgs.keychain
    pkgs.silver-searcher
    pkgs.stow
    pkgs.tldr
    pkgs.tree
    pkgs.zip
  ]
