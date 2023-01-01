{ pkgs, ... }:

let
  # https://nixos.wiki/wiki/TexLive
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-basic
      dvisvgm dvipng
      wrapfig amsmath ulem hyperref capt-of;
  });
in {
  home.packages = with pkgs; [
    emacs
    tex

    # LSP
    clang-tools # clangd
    rust-analyzer # rust
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
