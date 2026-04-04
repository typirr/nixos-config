{ config, pkgs, lib, ... }:
{

 networking = {
   hostName = "alpha";
   networkmanager = {
     enable = true 
   };

 };

}
