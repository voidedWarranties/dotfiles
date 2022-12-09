{ pkgs, ... }:

{
  home.packages = [
    pkgs.emacs
  ];

  home.file = {
    ".emacs.d/init.el".source = ./files/init.el;
    ".emacs.d/config.org".source = ./files/config.org;
  };

  services.emacs = {
    enable = true;
    defaultEditor = true;
  };
}
