{ pkgs, ... }:

let
  jovial = builtins.fetchGit {
    name = "jovial";
    url = "https://github.com/zthxxx/jovial.git";
    ref = "master";
    rev = "45fc6a07b834cd564013f09ed0fa27349c4c4bee";
  };
in {
   programs.zsh = {
     enable = true;
     oh-my-zsh = {
       enable = true;
       custom = "$HOME/.oh-my-zsh/custom/";
       theme = "jovial";
       plugins = [
         "git"
       ];
     };
     plugins = [
       {
         name = "zsh-autosuggestions";
         src = pkgs.fetchFromGitHub {
           owner = "zsh-users";
           repo = "zsh-autosuggestions";
           rev = "v0.7.0";
           sha256 = "sha256-KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
         };
       }
       {
         name = "zsh-syntax-highlighting";
         src = pkgs.fetchFromGitHub {
           owner = "zsh-users";
           repo = "zsh-syntax-highlighting";
           rev = "0.7.1";
           sha256 = "sha256-gOG0NLlaJfotJfs+SUhGgLTNOnGLjoqnUp54V9aFJg8=";
         };
       }
     ];
     initExtra = ''
       JOVIAL_SYMBOL[arrow]=" ･ω･*)ﾉ"
       JOVIAL_SYMBOL[arrow.git-clean]=" ･ω･*)ﾉ" # for emacs vterm (default breaks)

       . $HOME/.nix-profile/etc/profile.d/nix.sh
     '';
  };

  home.file = {
    ".oh-my-zsh/custom/themes/jovial.zsh-theme".source = jovial + "/jovial.zsh-theme";
  };
}
