{ pkgs, ... }:

let
  gpgConf = builtins.readFile ./gpg.conf;
  gpgAgentConf = builtins.readFile ./gpg-agent.conf;
in {
  home.packages = [
    pkgs.gnupg
  ];

  home.file = {
    ".gnupg/gpg.conf".text = gpgConf;
    ".gnupg/gpg-agent.conf".text = gpgAgentConf;
  };
}
