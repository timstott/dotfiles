{ pkgs, ... }:

{
  home.packages = [
    pkgs.silver-searcher
  ];

  home.file = {
    ".agignore".text = ''
      .git
      coverage
      node_modules
      tags
      tmp
    '';
  };
}
