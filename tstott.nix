{ pkgs ? import <nixpkgs> {} }:
let
  neovim = import ./neovim/default.nix {
    pkgs = pkgs;
  };

in
  [
    neovim
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
