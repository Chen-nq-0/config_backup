{
  config,
  lib,
  pkgs,
  ...
}:
let
  my.sparkle = pkgs.callPackage ./mihomo/mihomo.nix { };
in
{

  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      my.sparkle
      (makeAutostartItem {
        name = "sparkle";
        package = my.sparkle;
      })
      mangohud
    ];
  };

}
