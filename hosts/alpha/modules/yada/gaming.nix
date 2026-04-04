{ config, lib, pkgs , ... }:{
 environment.systemPackages = [
   lutris
   mangohud
   mangojuice

 ];
 programs.steam = {
   enable = true;
   protontricks = {
     enable = true; }; 
 };
 programs.gamemode = {
   enable = true; };
}
