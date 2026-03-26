{
  description = "nixy";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let system = "x86_64-linux";
  in {
    nixosConfigurations.nixy = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./system
        home-manager.nixosModules.home-manager
        {
	  home-manager.backupFileExtension = "backup";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.typirr = import ./home/typirr.nix;
        }
      ];
    };
  };
}
