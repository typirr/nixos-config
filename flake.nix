{
  description = "nixy";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let system = "x86_64-linux";
  in {
    nixosConfigurations.nixy = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./hosts/nixy
        home-manager.nixosModules.home-manager
        {
          home-manager.backupFileExtension = "backup";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.typirr = import ./users/typirr/home.nix;
        }
      ];
    };
  };
}
