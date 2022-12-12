isNixOS: self: super:

let
  pam_fixed = super.pam.overrideAttrs (finalAttrs: previousAttrs: {
    patches = if isNixOS then [ ] else [ ./patches/pam_chkpwd.patch ];
  });
in {
  i3lock-color = super.i3lock-color.override {
    pam = pam_fixed;
  };

  awesome = super.awesome.overrideAttrs (finalAttrss: previousAttrs: {
    version = "master-g1239cdf";
    src = super.fetchFromGitHub {
      owner = "awesomewm";
      repo = "awesome";
      rev = "1239cdf4bc9208f57e4bf018d462c2ee63bf0387";
      sha256 = "sha256-iAazEbkFOP6FyeUd4tXTQzPosqmNM0Mxf1c1m/eRKWs=";
    };
    patches = [ ];

    # Patch test files with #!/usr/bin/env lua
    postPatch = ''
      patchShebangs --build tests/
    '';
  });
}
