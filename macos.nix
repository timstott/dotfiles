let
  pkgs = import (fetchGit {
    name = "nixpkgs-darwin-2019-01-14";
    url = "https://github.com/NixOS/nixpkgs-channels";
    ref = "nixpkgs-18.09-darwin";
    rev = "0b471f71fada5f1d9bb31037a5dfb1faa83134ba";
  }) {};

  tstott = import ./tstott.nix {
    pkgs = pkgs;
  };
in
  tstott
