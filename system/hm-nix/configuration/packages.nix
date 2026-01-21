{
  inputs,
  system,
  pkgs,
  ...
}:
let
  wuwa-downloader = pkgs.callPackage ./config/own_nix/wuwa-downloader.nix { };
in
{

  home.packages = with pkgs; [
    wuwa-downloader
    nix-output-monitor
    nixfmt
    expect
    nixd
    fastfetch
    qq
    wechat
    fd
    ayugram-desktop
    xwayland-satellite
    brightnessctl
    xsel
    nautilus
    xdg-utils
    # inputs.umu.packages.${system}.default
    umu-launcher
    xdg-user-dirs
    lutris
    protonplus
    winetricks
    wineWowPackages.waylandFull
    gamemode
  ];
}
