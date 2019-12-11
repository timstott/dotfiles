{ pkgs, lib, ...}:
{
  home.packages = with pkgs; [
    git
  ];

  home.file = {
    ".config/git/ignore".source = ./gitignore;
    ".config/git/config".source = ./gitconfig;
    ".config/git/template/hooks/post-checkout".source = ./template/hooks/post-checkout;
    ".config/git/template/hooks/ctags".source = ./template/hooks/ctags;
    ".config/git/template/hooks/ctags".executable = true;
  };
}
