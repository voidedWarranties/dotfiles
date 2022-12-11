{ pkgs, lib, ... }:

{
  home.packages = [
    pkgs.i3lock-color
  ];

  services.xidlehook = {
    enable = true;
    detect-sleep = true;
    not-when-audio = true;

    timers = [
      {
        delay = 600;
        command = "export PATH=$PATH:${lib.makeBinPath [ pkgs.i3lock-color ]}; ~/.ksk/scripts/lock.sh";
      }
    ];
  };
}
