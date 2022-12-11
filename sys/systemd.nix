{ pkgs, config, ... }:

{
  systemd.user.sessionVariables = {
    # systemd fixes

    # emacsclient cursor
    XCURSOR_PATH = "${config.home.profileDirectory}/share/icons";

    # fcitx5 icons
    GDK_PIXBUF_MODULE_FILE = "${pkgs.librsvg}/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache";
  };
}
