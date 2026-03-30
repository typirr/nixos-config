# i3wm configuration
{ config, pkgs, ... }: {
  services.xserver.windowManager.i3 = {
    enable = true;
    # configFile = ../desktop/i3-config; # Use raw config
    # OR use native Nix config below:
    # config = { ... };
  };
}
