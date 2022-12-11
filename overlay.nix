isNixOS: self: super:

let
  pam_fixed = super.pam.overrideAttrs (finalAttrs: previousAttrs: {
    patches = if isNixOS then [ ] else [ ./patches/pam_chkpwd.patch ];
  });
in {
  i3lock-color = super.i3lock-color.override {
    pam = pam_fixed;
  };
}
