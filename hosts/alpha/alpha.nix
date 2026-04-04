{ config, pkgs, ... }:

{
  imports = [ ./hardware-alpha.nix ];

  networking.hostName = "alpha";

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
  services.xserver.xkb = {
    layout = "us,eg";
    options = "grp:alt_shift_toggle";
  };
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };

  users.users.typirr = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
 };

  nixpkgs.config.allowUnfree = true;

  programs.dconf.enable = true;
  environment.systemPackages = [
    pkgs.git
    pkgs.neovim
    pkgs.curl
    pkgs.wget
    pkgs.htop
    pkgs.fastfetch
    pkgs.btop
  ];

  fonts.packages = [
    pkgs.jetbrains-mono
  ];

  system.stateVersion = "25.11";
}
