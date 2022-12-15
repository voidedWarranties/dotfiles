{ config, ... }:

let
  feather = builtins.fetchGit {
    name = "feather";
    url = "https://github.com/feathericons/feather.git";
    ref = "refs/tags/v4.29.0";
  };
in {
  home.file = {
    ".ksk/assets/feather".source = config.lib.file.mkOutOfStoreSymlink (feather + "/icons");
  };
}
