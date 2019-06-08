{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.monero
  ];

  services.monero = {
    enable = true;
    rpc.address = "127.0.0.1";
    # calculate max KB outbound/day use 86400 (seconds per day) * rate
    # 128 KB/s is equivalent to 11 GB per day
    limits.upload = 128;
    extraConfig = ''
      out-peers=5
    '';
  };
}
