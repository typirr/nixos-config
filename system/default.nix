{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "nixy";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  swapDevices = [{
      device = "/swapfile";
     size = 4096;
  }];
  
  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
  };

  networking.networkmanager.enable = true;
  
  services.dbus.enable = true;
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "modesetting" ];
  services.displayManager.ly.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.xkb = {
    layout = "us,eg";
    options = "grp:alt_shift_toggle";
  };
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.typirr = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };
  
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    git neovim curl wget htop fastfetch
    xinit xauth
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
  ];
  system.stateVersion = "26.05";
}
