# Create NixOS machine via NixOPS
{
  cardboard = {
    deployment.targetEnv = "hetzner";
    # Manually create a subaccount to manage machine
    # Export HETZNER_ROBOT_USER and HETZNER_ROBOT_PASS accordingly
    deployment.hetzner.createSubAccount = false;
    deployment.hetzner.mainIPv4 = "88.198.57.174";
    deployment.hetzner.partitions = ''
      clearpart --all --initlabel --drives=sda,sdb

      part swap1 --recommended --label=swap1 --fstype=swap --ondisk=sda
      part swap2 --recommended --label=swap2 --fstype=swap --ondisk=sdb

      part btrfs.1 --grow --ondisk=sda
      part btrfs.2 --grow --ondisk=sdb

      btrfs / --data=1 --metadata=1 --label=root btrfs.1 btrfs.2
    '';
  };
}
