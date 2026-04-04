{
 
 description = "Dr.Flake";

 inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

 outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }:
    
 let
         x86l = "x86_64-linux";
         x86d = "x86_64-darwin";
	 i686l = "i686-linux";
 	 arm64l = "aarch64-linux";
	 arm64d = "aarch64-darwin";
      
 in {
     nixosConfigurations.alpha = nixpkgs.lib.nixosSystem {
       system = "${x86l}";
       modules = [
         
	 ./hosts/alpha
         
	 home-manager.nixosModules.home-manager {
          home-manager.backupFileExtension = "backup";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.typirr = import ./hosts/alpha/users/typirr/home.nix;
        }

       ];
     
     };
 
 };

}
