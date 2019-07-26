{ pkgs, ... }:

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

    # must place vim-go before polyglot
    # https://github.com/kalbasit/shabka/blob/51ef9da7bff14a583d82e5bf0ce14014bbf99a4a/modules/neovim/default.nix#L82-L84
    "vim-go"
    "polyglot"

    "rhubarb"  # GitHub extension for fugitive
    "solarized"
    "surround"
    "vim-abolish"
    "vim-dispatch"
    "vim-projectionist"
    "vim-test"
    "vim-repeat"
  ];

  vimRC = builtins.readFile ./init.vim;

  neovim = pkgs.neovim.override {
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
  };

  spell = builtins.readFile ./spell/en.utf-8.add;
in {
  home.packages = [
    neovim
  ];

  home.file = {
    ".config/nvim/spell/en.utf-8.add".text =  spell;
    ".config/nvim/ftplugin/gitcommit.vim".source = ./ftplugin/gitcommit.vim;
    ".config/nvim/ftplugin/go.vim".source = ./ftplugin/go.vim;
    ".config/nvim/ftplugin/markdown.vim".source = ./ftplugin/markdown.vim;
  };

  programs.zsh.shellAliases = {
    "vimrc" = "nix-store -qR $(which vim) | ag vimrc | xargs less";
  };
}
