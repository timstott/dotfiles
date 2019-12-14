{ config, lib, ...}:

let
  pkgs = import(fetchGit {
    name = "nixpkgs-unstable-2019-01-24";
    url = "https://github.com/NixOS/nixpkgs-channels";
    ref = "nixpkgs-unstable";
    rev = "11cf7d6e1ffd5fbc09a51b76d668ad0858a772ed";
  }) {};

  tmuxConf = lib.strings.concatStrings([
    (builtins.readFile ./tmux.conf)
    (builtins.readFile ./tmuxcolors.conf)
  ]);

in {
  home.packages = [
    pkgs.tmux
    pkgs.tmuxinator
  ];

  home.file = {
    ".tmux.conf".text = tmuxConf;
  };

  xdg.configFile = {
    "tmuxinator/dotfiles.yml".source = ./projects/dotfiles.yml;
  };

  programs.zsh.shellAliases = {
    mux = "tmuxinator";
  };
}
