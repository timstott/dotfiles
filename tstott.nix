{ pkgs ? import <nixpkgs> {} }:
let
  neovim = import ./neovim/default.nix {
    pkgs = pkgs;
  };

  tig = pkgs.callPackage ./tig/default.nix {};
in
  [
    neovim
    pkgs.awscli
    pkgs.coreutils
    pkgs.curl
    pkgs.ctags
    pkgs.fzf
    pkgs.git
    pkgs.gnupg
    pkgs.jq
    pkgs.keychain
    pkgs.silver-searcher
    pkgs.stow
    pkgs.tldr
    pkgs.tree
    pkgs.zip
    tig
  ]
