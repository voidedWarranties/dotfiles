{ ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrains Mono";
      size = 12.0;
    };
    extraConfig = ''
      confirm_os_window_close 0
    '';
  };
}
