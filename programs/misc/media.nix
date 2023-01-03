{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libsForQt5.okular
    libsForQt5.gwenview
    mpv
  ];
}
