{ config, pkgs, username, homeDirectory, ... }:

{
  home = {
    inherit username homeDirectory;
    stateVersion = "22.11";
  };

  programs.home-manager.enable = true;

  imports = [
    ./programs
  ];
}
