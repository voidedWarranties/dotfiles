{ pkgs, ... }:

{
  home.packages = with pkgs; [
    blender
    gimp
    krita
    inkscape

    obs-studio
    shotcut
    audacity
  ];
}
