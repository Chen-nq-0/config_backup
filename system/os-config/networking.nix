{ lib, ... }:
{
  imports = [
    #   ./mihomo/mihomo.nix
  ];
  networking = {
    hostName = "Cat";
    firewall.enable = false;
    dhcpcd.enable = false;
    useDHCP = lib.mkDefault true;
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
      wifi.powersave = true;
    };

    wireless.iwd = {
      enable = true;
    };
  };
  services.resolved.enable = false;
}
