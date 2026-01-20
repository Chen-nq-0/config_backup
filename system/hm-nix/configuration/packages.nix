{
  inputs,
  system,
  pkgs,
  ...
}:
{

  home.packages = with pkgs; [
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
