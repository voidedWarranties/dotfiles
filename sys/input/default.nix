{ pkgs, lib, ... }:

{
  # ensure plum install script dependencies
  home.packages = [
    pkgs.curl
    pkgs.git
  ];

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      fcitx5-mozc
    ];
  };

  home.file = {
    ".config/fcitx5/config".source = ./files/fcitx5_config;
    ".local/share/fcitx5/rime/default.custom.yaml".source = ./files/rime_default.custom.yaml;
  };

  home.activation = {
    # necessary setup for fcitx5-rime
    # see: rime/plum
    plumSetup = lib.hm.dag.entryAfter ["writeBoundary"] ''
      export PATH=$PATH:${lib.makeBinPath [ pkgs.curl pkgs.git ]} rime_frontend=fcitx5-rime
      $DRY_RUN_CMD \
        curl -fsSL https://raw.githubusercontent.com/rime/plum/master/rime-install | \
        bash -s -- prelude essay pinyin-simp
    '';
  };
}
