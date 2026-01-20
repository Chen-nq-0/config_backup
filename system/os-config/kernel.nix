{
  config,
  pkgs,
  lib,
  ...
}:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_cachyos-lto-znver4;
    #kernelPackages = pkgs.linuxPackages_xanmod_latest;
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        gfxmodeEfi = "1920x1080";
        configurationLimit = 10;
        theme = "${pkgs.catppuccin-grub.override { flavor = "latte"; }}";
        fontSize = 18;
      };

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
  };

  hardware.bluetooth.enable = true;

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services = {
    scx = {
      enable = true;
      #package = pkgs.scx_git.rustscheds;
      scheduler = "scx_rusty";
    };
  };
}
