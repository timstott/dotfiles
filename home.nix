{ config, pkgs, ... }:

{
  imports = [
    ./home/ag.nix
    ./home/fzf.nix
    ./home/gpg/default.nix
    ./home/tmux/default.nix
    ./zsh/default.nix
  ];


  programs.home-manager = {
    enable = true;
  };

}
