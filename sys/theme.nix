{ pkgs, config, ... }:

{
  home.pointerCursor = {
    package = pkgs.openzone-cursors;
    name = "OpenZone_Black";

    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };
}
