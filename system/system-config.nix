{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware.nix
    ./os-config/nix.nix
    ./os-config/polkit.nix
    ./os-config/environment.nix
    ./os-config/programs.nix
    ./os-config/services.nix
    ./os-config/networking.nix
    ./os-config/kernel.nix
    ./os-config/xdg-portal.nix
    ./os-config/fonts.nix
    ./os-config/users.nix
    ./os-config/GPU.nix
    ./os-config/obs-studio.nix
    ./os-config/steam.nix
  ];

  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "zh_CN.UTF-8";
  system.stateVersion = "26.05";
}
