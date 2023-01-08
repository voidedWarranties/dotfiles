{ pkgs, ... }:

let
  git-libsecret = pkgs.git.override { withLibsecret = true; };
in {
  programs.git = {
    enable = true;
    diff-so-fancy.enable = true;
    lfs.enable = true;
    userEmail = "hi+github@voidedxd.xyz";
    userName = "voidedWarranties";
    extraConfig = {
      credential.helper = "${git-libsecret}/bin/git-credential-libsecret";
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      notARepository = "skip";
    };
  };
}
