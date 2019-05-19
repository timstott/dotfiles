{}:

let
  pkgs = import (fetchGit {
    name = "nixpkgs-unstable-2019-01-24";
    url = "https://github.com/NixOS/nixpkgs-channels";
    ref = "nixpkgs-unstable";
    rev = "11cf7d6e1ffd5fbc09a51b76d668ad0858a772ed";
  }) {};

in
  [
    pkgs.tmux
    pkgs.tmuxinator
  ]

