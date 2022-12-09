{ ... }:

{
  programs.git = {
    enable = true;
    diff-so-fancy.enable = true;
    lfs.enable = true;
    userEmail = "hi+github@voidedxd.xyz";
    userName = "voidedWarranties";
  };

  programs.lazygit = {
    enable = true;
    settings = {
      notARepository = "skip";
    };
  };
}
