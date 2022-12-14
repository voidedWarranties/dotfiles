{ ... }:

let
  colors = import ../../colors;
in with colors; {
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrains Mono";
      size = 12.0;
    };
    settings = {
      shell = "zsh";
      confirm_os_window_close = 0;
      background = utils.hsvToHexP theme.bg0;
      background_opacity = "0.95";
    };
  };
}
