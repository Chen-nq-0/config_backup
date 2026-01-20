{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts-color-emoji
      maple-mono.NF-CN
      material-design-icons
    ];

    fontconfig = {
      useEmbeddedBitmaps = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        serif = [ "Maple Mono NF CN" ];
        sansSerif = [ "Maple Mono NF CN" ];
        monospace = [ "Maple Mono NF CN" ];
      };
    };
  };
}
