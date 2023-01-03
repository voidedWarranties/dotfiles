{ pkgs, ... }:

{
  home.packages = [
    pkgs.mpc-cli
  ];

  services.mpd = {
    enable = true;
    musicDirectory = ~/Music;
    playlistDirectory = ~/Music/Playlists;
    extraConfig = ''
      auto_update "yes"

      audio_output {
        type "pulse"
        name "MPD PulseAudio Output"
      }
    '';
  };

  services.mpdris2.enable = true;
}
