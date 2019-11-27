{ lib, pkgs, ...}:

let
  tmux = pkgs.callPackage(pkgs.fetchurl {
    # tmux 2.8 package
    # https://github.com/NixOS/nixpkgs/blob/76f803f44e2d085c929be6ac78f41631b5adfd35/pkgs/tools/misc/tmux/default.nix
    url = "https://raw.githubusercontent.com/NixOS/nixpkgs/76f803f44e2d085c929be6ac78f41631b5adfd35/pkgs/tools/misc/tmux/default.nix";
    sha256 = "09mi4ymhmyz5rr0skq4vq20kwx18hq0qsbihrd2x2n4nmygpdrng";
  }) {};

  tmuxConf = lib.strings.concatStrings([
    (builtins.readFile ./tmux.conf)
    (builtins.readFile ./tmuxcolors.conf)
  ]);

in {
  home.packages = [
    tmux
    pkgs.tmuxinator
  ];

  home.file = {
    ".tmux.conf".text = tmuxConf;
  };

  programs.zsh.shellAliases = {
    mux = "tmuxinator";
  };
}
