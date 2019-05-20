{ config, pkgs, ... }:

{
  environment.systemPackages = [];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    promptInit = "";
  };

  users.users."timothy.stott" = {
    shell = pkgs.zsh;
  };

  system.defaults.dock = {
    show-recents = false;
    orientation = "left";
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix.maxJobs = 1;
  nix.buildCores = 1;
}
