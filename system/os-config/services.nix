{ pkgs, ... }:

{
  services = {

    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    linyaps.enable = true;
    gvfs.enable = true;
  };
}
