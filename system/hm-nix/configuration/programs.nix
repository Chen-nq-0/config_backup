{ pkgs, ... }:
{
  programs = {
  #  waybar.enable = true;
  #  fuzzel.enable = true;
    git.enable = true;
    home-manager.enable = true;
  };
 # xdg.configFile."waybar".source = ./config/waybar;
  #xdg.configFile."fuzzel".source = ./config/fuzzel;
}
