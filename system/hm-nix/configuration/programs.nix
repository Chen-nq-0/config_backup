{ pkgs, ... }:
{
  programs = {
    #  waybar.enable = true;
    #  fuzzel.enable = true;
    git = {
      enable = true;
      signing = {
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMGukqRVsEhYXWiA6GRsyUreFz19aOMBc5ABHqNH2Fd3 woshiliuziao@gmail.com";
        signByDefault = true;
      };
      settings = {
        user = {
          name = "Chen-nq-0";
          email = "woshiliuziao@gmail.com";
        };
        gpg = {
          format = "ssh";
        };
      };
    };
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "*" = {
          addKeysToAgent = "yes";
        };
      };
    };

    home-manager.enable = true;
  };
  # xdg.configFile."waybar".source = ./config/waybar;
  #xdg.configFile."fuzzel".source = ./config/fuzzel;
}
