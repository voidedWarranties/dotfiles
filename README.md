# dotfiles

dotfiles for my personal setups (mostly Fedora systems) managed using [Nix](https://nixos.org/download.html)
and [home-manager](https://github.com/nix-community/home-manager).

some manual setup is required:

- installing Nix and enabling flakes
- activating the home-manager configuration

and, less obviously:

- adding `zsh` to `/etc/shells` (`./scripts/shell_setup.sh`)
- adding `i3lock` to `/etc/pam.d` (`./scripts/pam_setup.sh`)

there are no guarantees that this setup works on any non-Fedora distro.

## quirks

using home-manager sometimes leads to poor support or odd circumstances,
especially when not operating in NixOS.

### login shell

the login shell cannot be changed to a Nix-installed shell unless it is added to `/etc/shells`.

see: `scripts/shell_setup.sh`

### the window manager

home-manager cannot change the window manager without outside intervention.

see: `programs/awesome`

### screen lockers

screen lockers must be present in `/etc/pam.d` to function.

see: `scripts/pam_setup.sh`

lockers like `i3lock` also depend on `unix_chkpwd`, the setuid wrapper of which is not available outside of NixOS.
as such, a patch is needed for lockers to function at all.

see: `patches/pam_chkpwd.patch` and `overlay.nix`

### systemd environment

using systemd to start applications like the Emacs server and fcitx5 leads to some issues.

for example, Emacs depends on the environment variable `XCURSOR_PATH` to display the right mouse pointer when hovering the window,
and fcitx5 depends on `GDK_PIXBUF_MODULE_FILE` to show icons.

see: `sys/systemd.nix`

### fcitx5-rime

rime depends on something called [`plum`](https://github.com/rime/plum) to install input schemes.
otherwise, rime doesn't do anything.

Nix does not support `plum`.

see: `sys/input/default.nix`
