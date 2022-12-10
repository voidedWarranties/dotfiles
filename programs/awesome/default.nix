{ ... }:

{
  xsession = {
    enable = true;
    windowManager.awesome = {
      enable = true;
    };
  };

  services.unclutter = {
    enable = true;
    timeout = 2;
  };

  services.picom = {
    enable = true;
  };

  home.file = {
    ".config/awesome/rc.lua".source = ./files/rc.lua;
    ".config/awesome/theme.lua".source = ./files/theme.lua;
    ".config/awesome/wallpaper.jpg".source = ./files/wallpaper.jpg;
  };
}
