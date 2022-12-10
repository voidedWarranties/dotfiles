{ pkgs, ... }:

{
  home.pointerCursor = {
    package = pkgs.openzone-cursors;
    name = "OpenZone_Black";

    gtk.enable = true;
    x11.enable = true;
  };

  gtk.enable = true;
}
