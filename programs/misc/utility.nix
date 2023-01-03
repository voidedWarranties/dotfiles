{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gotop
    keepassxc

    ffmpeg_5
    yt-dlp
  ];

  home.file = {
    ".config/gotop/gotop.conf".text = ''
      graphhorizontalscale=7
      helpvisible=false
      colorscheme=default
      updateinterval=1000000000
      averagecpu=false
      percpuload=false
      tempscale=C
      statusbar=true
      netinterface=all
      layout=default
      maxlogfile=5000000
      mbps=true
      nvidia=false
    '';
  };
}
