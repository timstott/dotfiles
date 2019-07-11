{ pkgs, lib, ...}:

let
  gitconfig = builtins.readFile ./gitconfig;

  ctagsHook = builtins.readFile ./template/hooks/ctags;
in {
  programs.git = {
    enable = true;
    extraConfig = gitconfig;
  };

  home.file = {
    ".gitignore".source = ./gitignore;
    ".config/git/template/hooks/post-checkout".source = ./template/hooks/post-checkout;
    ".config/git/template/hooks/ctags".text = ctagsHook;
    ".config/git/template/hooks/ctags".executable = true;
  };
}
