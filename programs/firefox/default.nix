{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override {
      cfg = {
        enableTridactylNative = true;
      };
    };

    profiles.default = {
      id = 0;
      name = "default";

      search.default = "DuckDuckGo";
      search.force = true;

      settings = import ./settings.nix;
    };

    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      multi-account-containers
      ublock-origin
      tridactyl
      consent-o-matic
    ];
  };

  home.file = {
    ".tridactylrc".source = ./files/.tridactylrc;
  };
}
