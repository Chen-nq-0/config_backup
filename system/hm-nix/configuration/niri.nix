{
  inputs,
  pkgs,
  system,
  ...
}:
{
  imports = [ inputs.niri.homeModules.niri ];

  programs.niri = {
    enable = true;
    package = pkgs.niri; # inputs.niri.packages.${system}.niri-unstable;
  };

  xdg.configFile."niri/config.kdl".source = ./config/niri/config.kdl;
}
