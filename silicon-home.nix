{ config, pkgs, ... }:

{
  imports = [
    ./home.nix
  ];

  programs.firefox = {
    enable = true;
  };

  # i3 config
  # home.sessionVariables =  { TERMINAL = "termite"; };
  # programs.bash.sessionVariables =  { TERMINAL = "termite"; };
  # programs.zsh.sessionVariables = { TERMINAL = "termite"; };

  # termite config
  programs.termite = {
    enable = true;
    font = "DejaVuSansMono Nerd Font 13";
    audibleBell = false;
    cursorBlink = "off";
    scrollbackLines = 10000;
    # Source: https://github.com/alpha-omega/termite-colors-solarized/blob/master/solarized-dark
    colorsExtra = ''
    foreground = #839496
    foreground_bold = #eee8d5
    #foreground_dim = #888888
    background = #002b36
    cursor = #93a1a1

    # if unset, will reverse foreground and background
    #highlight = #839496

    # colors from color0 to color254 can be set
    color0 = #073642
    color1 = #dc322f
    color2 = #859900
    color3 = #b58900
    color4 = #268bd2
    color5 = #d33682
    color6 = #2aa198
    color7 = #eee8d5
    color8 = #002b36
    color9 = #cb4b16
    color10 = #586e75
    color11 = #657b83
    color12 = #839496
    color13 = #6c71c4
    color14 = #93a1a1
    color15 = #fdf6e3
    '';
  };
}
