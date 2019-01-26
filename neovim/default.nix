{ pkgs }:

let
  customPlugings = {
    fzf-wrapper = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = pkgs.fzf.name;
      src = pkgs.fzf.src;
    };
  };

  pluginNames = [
    "commentary"
    "easy-align"
    "fugitive" # Git wrapper
    "fzf-vim"
    "fzf-wrapper"
    "lightline-vim"
    "nerdtree"
    "polyglot"
    "rhubarb"  # GitHub extension for fugitive
    "solarized"
    "surround"
    "vim-abolish"
    "vim-projectionist"
    "vim-test"
  ];

  vimRC = builtins.readFile ./init.vim;
in
  pkgs.neovim.override {
    configure = {
      customRC = vimRC;
      vam.knownPlugins = pkgs.vimPlugins // customPlugings;
      vam.pluginDictionaries = [
        {
          names = pluginNames;
        }
      ];
    };

    vimAlias = true;
    withPython = true;
  }
