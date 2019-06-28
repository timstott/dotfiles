{ config, pkgs, ... }:

{
  imports = [
    ./home/tmux/default.nix
  ];


  programs.home-manager = {
    enable = true;
  };

}
