{ config, pkgs, ... }:

let
  mosh = import ./packages/mosh/default.nix {};
in {
  imports = [
    ./home/ag.nix
    ./home/ctags/default.nix
    ./home/direnv/default.nix
    ./home/fzf.nix
    ./home/gpg/default.nix
    ./home/tig/default.nix
    ./home/tmux/default.nix
    ./neovim/default.nix
    ./zsh/default.nix
  ];

  home.packages = [
    mosh
  ];

  programs.home-manager = {
    enable = true;
  };
}
