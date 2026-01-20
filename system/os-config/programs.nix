{
  config,
  pkgs,
  ...
}:
{
  programs = {
    dconf.enable = true;
    zsh.enable = true;
  };
}
