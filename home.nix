{ config, pkgs, username, homeDirectory, ... }:

{
  home = {
    inherit username homeDirectory;
    stateVersion = "22.11";
    packages = [
      pkgs.nixgl.auto.nixGLDefault
    ];
  };

  programs.home-manager.enable = true;

  targets.genericLinux.enable = true;

  imports = [
    ./programs
    ./sys
  ];
}
