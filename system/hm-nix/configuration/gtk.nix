{ pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.latteLight;
    name = "catppuccin-latte-light-cursors";
    size = 16;
  };
  gtk = {
    enable = true;

    theme = {
      package = pkgs.magnetic-catppuccin-gtk.override {
        accent = [ "red" ];
        shade = "light";
        tweaks = [ "frappe" ];
      };
      name = "Catppuccin-GTK-Red-Light-Frappe";
    };

    iconTheme = {
      package = pkgs.tela-circle-icon-theme.override { colorVariants = [ "blue" ]; };
      name = "Tela-circle-blue-dark";
    };

    font = {
      name = "Maple Mono NF CN";
      size = 12;
    };
  };
}
