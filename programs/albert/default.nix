{ pkgs, ... }:

{
  home.packages = [
    pkgs.albert
  ];

  home.file.".config/albert/albert.conf".source = ./files/albert.conf;
}
