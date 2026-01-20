{ pkgs, lib, ... }:
let
  my.sparkle = pkgs.callPackage ./mihomo/mihomo.nix { };
in
{
  security = {
    polkit.enable = true;

    wrappers.sparkle = {
      owner = "root";
      group = "root";
      capabilities = "cap_net_bind_service,cap_net_raw,cap_net_admin=+ep";
      source = "${lib.getExe my.sparkle}";
    };

  };
}
