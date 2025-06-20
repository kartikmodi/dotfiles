{
  description = "Flake for home base";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixgl.url = "github:nix-community/nixGL";
    # explicitly declare lib from nixpkgs for usage as flake:lib
    lib = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
      inputs = { };
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      lib,
      nixgl,
      ...
    }:
    let
      system = "x86_64-linux";
      username = "workstation";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      nixglPkgs = nixgl.packages.${system};
    in
    {
      homeConfigurations = {
        workstation = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit
              pkgs
              username
              nixgl
              nixglPkgs
              ;
          };

          modules = [
            ./home.nix
          ];
        };
      };
    };
}
