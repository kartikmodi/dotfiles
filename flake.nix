{
  # warning: download buffer is full; consider increasing the 'download-buffer-size' settin
  description = "Flake for home base";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixgl.url = "github:nix-community/nixGL";
    nixgl.inputs.nixpkgs.follows = "nixpkgs";
    # explicitly declare lib from nixpkgs for usage as flake:lib
    # lib = {
    #   url = "github:NixOS/nixpkgs/nixos-unstable";
    #   inputs = { };
    # };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      # lib,
      nixgl,
      ...
    }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      username = "workstation";

      # Helper to create pkgs for a given system
      mkPkgs =
        system:
        import nixpkgs {
          inherit system;
          config = {
            allowUnfree = true;
          };
        };

      # Helper to create home configuration for a given system
      mkHomeConfig =
        system:
        let
          pkgs = mkPkgs system;
          nixglPkgs = nixgl.packages.${system};
        in
        home-manager.lib.homeManagerConfiguration {
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
    in
    {
      homeConfigurations = {
        amd64 = mkHomeConfig "x86_64-linux";
        aarch64 = mkHomeConfig "aarch64-linux";
      };
    };
}
