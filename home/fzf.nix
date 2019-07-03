{ pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;

    # Set ag as the default source for fzf to respect .gitignore and .agignore
    # FZF_DEFAULT_COMMAND
    defaultCommand = ''
      ${pkgs.ag}/bin/ag --hidden -g \"\"
    '';

    # FZF_DEFAULT_OPTS
    defaultOptions = [
      "--color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254"
      "--color info:254,prompt:37,spinner:108,pointer:235,marker:235"
    ];
  };
}
