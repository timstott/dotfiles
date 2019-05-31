{ pkgs }:

let
  customPlugings = {
    fzf-wrapper = pkgs.vimUtils.buildVimPluginFrom2Nix {
      name = pkgs.fzf.name;
      src = pkgs.fzf.src;
    };
  };

  pluginNames = [
    "ale"
    "commentary"
    "easy-align"
    "fugitive" # Git wrapper
    "fzf-vim"
    "fzf-wrapper"
    "lightline-vim"
    "nerdtree"

    # must place vim-go before polyglot
    # https://github.com/kalbasit/shabka/blob/51ef9da7bff14a583d82e5bf0ce14014bbf99a4a/modules/neovim/default.nix#L82-L84
    "vim-go"
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
