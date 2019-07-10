{ pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  home.file = {
    ".config/direnv/direnvrc".text = builtins.readFile ./direnvrc;
  };
}
