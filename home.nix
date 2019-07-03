{ config, pkgs, ... }:

{
  imports = [
    ./home/tmux/default.nix
    ./zsh/default.nix
    ./home/ag.nix
    ./home/fzf.nix
  ];


  programs.home-manager = {
    enable = true;
  };

}
