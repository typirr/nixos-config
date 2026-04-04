{ config, pkgs, lib, ... }:
{

 boot.kernel.sysctl = {
   "vm.swappiness" = 10;

 };

 swapdevices = [{
   devices = "/swapfiles";
   size = 4096;

 }];

 zramswap = {
   enable = true;
   memorypercent = 50;

 };
 
}
