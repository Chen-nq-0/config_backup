{ pkgs, ... }:
{
  users.users.agonie = {
    isNormalUser = true;
    home = "/home/agonie";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "gameusers"
    ];
  };
}
