{ config, pkgs, ... }:

let
  mosh = import ./packages/mosh/default.nix {};
  show-path = import ./packages/show-path/default.nix {};
in {
  imports = [
    ./home/ag.nix
    ./home/ctags/default.nix
    ./home/direnv/default.nix
    ./home/fzf.nix
    ./home/git/default.nix
    ./home/gpg/default.nix
    ./home/ruby/default.nix
    ./home/tig/default.nix
    ./home/tmux/default.nix
    ./neovim/default.nix
    ./zsh/default.nix
  ];

  home.packages = [
    show-path
    mosh
    pkgs.awscli
    pkgs.coreutils
    pkgs.curl
    pkgs.gnused
    pkgs.htop
    pkgs.jq
    pkgs.keychain
    pkgs.tldr
    pkgs.tree
    pkgs.zip
  ];

  programs.home-manager = {
    enable = true;
  };
}
