{ config, lib, pkgs, ... }:
{
  imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ./monerod.nix
  ];

  swapDevices = [
    { label = "swap1"; }
    { label = "swap2"; }
  ];
  fileSystems = {
    "/" = {
      fsType = "btrfs";
      label = "root";
    };
  };
  boot.loader.grub.devices = [
    "/dev/sda"
    "/dev/sdb"
  ];
  boot.initrd.availableKernelModules = [ "ahci" "sd_mod" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [];

  networking = {
    hostName = "cardboard";
    defaultGateway = "88.198.57.161";
    interfaces.eth0 = {
      ipv4.addresses = [
        {
          address = "88.198.57.174";
          prefixLength= 27;
        }
      ];
    };
    localCommands = ''
      ip -6 addr add '2a01:4f8:222:588::/64' dev 'eth0' || true
      ip -4 route change '88.198.57.160/27' via '88.198.57.161' dev 'eth0' || true
      ip -6 route add default via 'fe80::1' dev eth0 || true
    '';
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
    ];

    firewall.trustedInterfaces = [];
    firewall.logRefusedConnections = false;
  };

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="net", ATTR{address}=="c8:60:00:df:0f:6d", NAME="eth0"
  '';

  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    permitRootLogin = "without-password";
    ports = [45331];
    extraConfig = ''
      # Enable automatic removal of stale sockets when connecting to the remote machine
      StreamLocalBindUnlink yes
    '';
  };

  services.ntp = {
    enable = true;
    servers = [
      "ntp1.hetzner.de"
      "ntp2.hetzner.com"
      "ntp3.hetzner.net"
    ];
  };

  time.timeZone = "Europe/Berlin";

  environment.systemPackages = [
    pkgs.coreutils
    pkgs.git
    (pkgs.neovim.override {
      vimAlias = true;
    })
    pkgs.silver-searcher
    pkgs.stow
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    promptInit = "";
  };

  programs.mosh = {
    enable = true;
  };

  users.users.root = {
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDPuFf0ddvuLv5fR3KTZ+Y5Fgu9iRwKUdcSQHNZ8xkLJ1+bZabRu6wUZ66sK6DF/511XImyGhO59VF3opWl0zUZtSF6WsW68GYwIATGrzkmMeou2c6QaaM1vlxfMc4rQzzGpnmrUQI/KUjmsGbJZEduogCHvLmGPopo0lOlZETiT7DD5zIpXgGlugE2o4PISWm0RoWHwNbHSv0okmFbZavCe57iTlWBiPt6FSNiWsBPBb5UXMbotusByPFcoIZUI/aZD03jaTYS6j2cS5RyHZlHcUaqq1mCpxQRqraEIgROYptycD9uLjsplQJMi9YrZRfm64bKE8Ijmvei5L2Q1+ILloV61Yjjm4QDsHxWGes70F0pp64tQIBPGg0YQE6psnL1Tr0WSZVdEE72IsTFgu//VkDMrXPfd/4URlJYcGCAp42V68lPGZBeSGyd2Z3LMNwzH//X978+wMMRueR2z9he0M1lWuiM2GDAv1DgnQ0dGrfreo6c28oPfjaRCFlUkIvMp1hMkIzpC4n7ajy9ODcFVWSkFrf7ceChc3AKSaPtGajvwYPA1j3U7JduPQ5bPb6M8j5w0nH1RqG1svIjbXFg0eYo1i7+cP6nZRtTW406y7T+Ixblw5CRvygk9H8Dhc7qeyasDp0z73zAGqVOBxxvKih4c6jAFmzD1HJwO5lquQ=="
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCeJW0Flfq29mibc1dV8u4IH0IVeoN/iuvmCi8kipgQAKYTFpEdS11a0fq6YmWMmHTKK9k/AvF6HUcAETDKxDPri8ZAYqi19LkzU5ivz4gRo8WwjqK69PCC1rj2wwMl7ebRl8NhA7oYIUVYuViKlC8r4jnBgcMy1gMv5H5Io6LgeP5m5Aku8ob4P3luyuvbSB+ocq84r8Gq9JuJBvrriRpbkqBGiR/RMYsxryHVwIwXx+Z0KcZetkYTnaFP3QqZkMbbl5EVGBE7Uu7HZZsUhzm/SVQswv10kHKuXg68FqAijycvyKapF4xBxYNYG4oPPu+g3Nd2WURof0DHGgpQbfPe/81TBG2AaMizUDEHSw3//TSCKOjF9xo5PIoGyTWHuRMpigoBNA3b+favjh3tRjDYdew91WAc/SEM0/egEJD07C+7zj8PUYQxhX0y8nJVOrCyEt82P8DmSLBSK3Xtp83cwVIQA8d0VgF3drXgrc16u1gaX5iU0Uys/zLJ5tClm/tL6If0NzRsxpRLf7ssZ3RkStdyXafcAT3JuiItAhfNchnhbLJKvFUkTPNOnd2DYmYgXHNNeLLwX7gBiggwpgeRsqjCplNf/DusFMFo6gpDJ26QRWF9iPMsDr3eUIT/jfA0xmvtKcgTXz8G/RAOPzuaivv+qJLqpLpU7q9ZMuzVaQ=="
    ];
  };

  users.users.tstott = {
    shell = pkgs.zsh;
    isNormalUser = true;
    createHome = true;
    home = "/home/tstott";
    extraGroups = [
      "docker"
      # members of wheel group can sudo
      "wheel"
    ];

    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCeJW0Flfq29mibc1dV8u4IH0IVeoN/iuvmCi8kipgQAKYTFpEdS11a0fq6YmWMmHTKK9k/AvF6HUcAETDKxDPri8ZAYqi19LkzU5ivz4gRo8WwjqK69PCC1rj2wwMl7ebRl8NhA7oYIUVYuViKlC8r4jnBgcMy1gMv5H5Io6LgeP5m5Aku8ob4P3luyuvbSB+ocq84r8Gq9JuJBvrriRpbkqBGiR/RMYsxryHVwIwXx+Z0KcZetkYTnaFP3QqZkMbbl5EVGBE7Uu7HZZsUhzm/SVQswv10kHKuXg68FqAijycvyKapF4xBxYNYG4oPPu+g3Nd2WURof0DHGgpQbfPe/81TBG2AaMizUDEHSw3//TSCKOjF9xo5PIoGyTWHuRMpigoBNA3b+favjh3tRjDYdew91WAc/SEM0/egEJD07C+7zj8PUYQxhX0y8nJVOrCyEt82P8DmSLBSK3Xtp83cwVIQA8d0VgF3drXgrc16u1gaX5iU0Uys/zLJ5tClm/tL6If0NzRsxpRLf7ssZ3RkStdyXafcAT3JuiItAhfNchnhbLJKvFUkTPNOnd2DYmYgXHNNeLLwX7gBiggwpgeRsqjCplNf/DusFMFo6gpDJ26QRWF9iPMsDr3eUIT/jfA0xmvtKcgTXz8G/RAOPzuaivv+qJLqpLpU7q9ZMuzVaQ=="
    ];
  };

  security.sudo = {
    wheelNeedsPassword = true;
    extraConfig = ''
      Defaults:tstott timestamp_timeout=120
    '';
  };

  virtualisation.docker.enable = true;

  nix.maxJobs = 8;
  powerManagement.cpuFreqGovernor = "powersave";

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09";
}
