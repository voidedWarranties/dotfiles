{ config, pkgs, username, homeDirectory, ... }:

{
  home = {
    inherit username homeDirectory;
    stateVersion = "22.11";
  };

  programs.home-manager.enable = true;

  targets.genericLinux.enable = true;

  imports = [
    ./programs
    ./fonts.nix
  ];
}
