{ pkgs ? import <nixpkgs> {} }:
let

in
  [
    pkgs.coreutils
    pkgs.curl
    pkgs.git
    pkgs.jq
    pkgs.silver-searcher
    pkgs.stow
    pkgs.tig
    pkgs.tldr
    pkgs.tree
  ]
