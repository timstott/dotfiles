{ pkgs, lib, ...}:

let
  pureZsh = pkgs.callPackage ./pure-prompt.nix {};
  zshConf = lib.strings.concatStrings(map builtins.readFile [
    ./zshrc
    ./.zconfig/docker.zsh
    ./.zconfig/git.zsh
    ./.zconfig/go.zsh
    ./.zconfig/keychain.zsh
    ./.zconfig/node.zsh
    ./.zconfig/ruby.zsh
    ./.zconfig/source_dotenv.zsh
  ]);
in {
  home.packages = [
    pureZsh
    pkgs.nix-zsh-completions
  ];

  programs.zsh = {
    enable = true;

    # complition is enabled in zshrc
    enableCompletion = false;
    initExtra = zshConf;
  };
}
