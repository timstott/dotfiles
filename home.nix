{ config, pkgs, ... }:

{
  imports = [
    ./home/tmux/default.nix
    ./zsh/default.nix
  ];


  programs.home-manager = {
    enable = true;
  };

}
