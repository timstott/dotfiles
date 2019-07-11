{ pkgs, ... }:

{
  home.packages = [
    pkgs.ctags
  ];

  home.file = {
    ".ctags".text = builtins.readFile ./ctags;
  };
}
