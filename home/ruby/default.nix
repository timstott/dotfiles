{ pkgs, ... }:

let
  lint-ruby = import ./lint-ruby.nix {};
in {
  home.packages = [
    lint-ruby
  ];

  home.file = {
    ".aprc".source = ./aprc;
    ".gemrc".source = ./gemrc;
    ".pryrc".source = ./pryrc;
  };
}
