{
  inputs,
  config,
  pkgs,
  lib,
  system,
  nix-vscode-extensions,
  ...
}:
{
  imports = [
    ./configuration/core.nix
    ./configuration/packages.nix
    ./configuration/gtk.nix
    ./configuration/programs.nix
    ./configuration/niri.nix
    ./configuration/vscode.nix
    ./configuration/ghostty.nix
    ./configuration/zsh.nix
    ./configuration/starship.nix
    ./configuration/helix.nix
    ./configuration/input.nix
    ./configuration/zen-browser.nix
    ./configuration/noctalia.nix
  ];
  services.udiskie = {
    enable = true;
  };
}
