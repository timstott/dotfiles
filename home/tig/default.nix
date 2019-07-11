{ pkgs, ... }:

let
  tigConf = builtins.readFile ./tigrc;
in {
  home.packages = [
    pkgs.tig
  ];

  home.file = {
    ".config/tig/config".text = tigConf;
  };
}
