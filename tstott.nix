{ pkgs ? import <nixpkgs> {} }:
let
  neovim = import ./neovim/default.nix {
    pkgs = pkgs;
  };

  tmux = pkgs.callPackage ./tmux/default.nix {};
in
  [
    neovim
    pkgs.awscli
    pkgs.coreutils
    pkgs.curl
    pkgs.fzf
    pkgs.git
    pkgs.gnupg
    pkgs.jq
    pkgs.keychain
    pkgs.silver-searcher
    pkgs.stow
    pkgs.tig
    pkgs.tldr
    pkgs.tree
    pkgs.zip
    tmux
  ]
