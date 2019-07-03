{ config, pkgs, ... }:

{
  imports = [
    ./home/tmux/default.nix
    ./zsh/default.nix
    ./home/ag.nix
  ];


  programs.home-manager = {
    enable = true;
  };

}
