{
  description = "home-manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:guibou/nixGL";
  };

  outputs = { nixpkgs, nur, home-manager, nixgl, ... }:
    let
      system = "x86_64-linux";
      getPkgs = isNixOS:
        import nixpkgs {
          inherit system;
          overlays = [
            nur.overlay
            nixgl.overlay
            (import ./overlay.nix isNixOS)
          ];
        };
    in {
      homeConfigurations.ksk = home-manager.lib.homeManagerConfiguration {
        pkgs = getPkgs false;

        modules = [
          ./home.nix
        ];

        extraSpecialArgs = {
          username = "voided_etc";
          homeDirectory = "/home/voided_etc";
        };
      };
    };
}
