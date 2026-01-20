{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "Catppuccin Mocha";
      font-size = 14;
      font-family = "Maple Mono NF CN";
    };
  };
}
