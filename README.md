# NixOS Configuration

Declarative NixOS configuration using Flakes and Home Manager.

## System Information

| Component | Detail |
|-----------|--------|
| **Hostname** | nixy |
| **Window Manager** | i3wm |
| **Architecture** | x86_64-linux |
| **Hardware** | HP Compaq 6005 Pro MT PC |
| **CPU** | AMD Athlon(tm) II X2 B28 |
| **GPU** | AMD Radeon HD 4200 |

## Directory Structure

    /etc/nixos/
    ├── flake.nix              # Main entry point
    ├── hosts/
    │   ├── common/            # Shared configuration across all hosts
    │   └── nixy/              # Machine-specific configuration
    ├── users/
    │   └── typirr/            # User-level configuration (Home Manager)
    ├── modules/
    │   ├── desktop/           # Window manager, bar, themes
    │   ├── programs/          # Reusable program modules
    │   └── system/            # System-level modules
    └── assets/                # Static files (wallpapers, scripts)

## Features

- **Modular Design:** Separation of system, user, and hardware configurations.
- **Reproducibility:** Locked inputs via `flake.lock` for consistent builds.
- **Home Manager Integration:** Declarative user environment management.
- **i3wm Configuration:** Native Nix implementation (no raw config files).

## Inspirations

This configuration follows architectural patterns from:

- [tiredofit/nixos-config](https://github.com/tiredofit/nixos-config)
- [argosnothing/nixos-config](https://github.com/argosnothing/nixos-config)
