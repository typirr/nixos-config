{ pkgs, ... }:

{
  home.username = "typirr";
  home.homeDirectory = "/home/typirr";
  programs.bash.shellAliases = {
  snvim = "sudo -E nvim";
  };
  home.file.".config/i3status/config".text = ''
   general {
     colors = true
     interval = 5
   }

   order += "time"

   time {
     format = "%Y-%m-%d %H:%M"
   }
   '';
  home.file.".xinitrc".text = ''
    exec i3
  '';
  home.file.".config/alacritty/alacritty.toml".text = ''
   [font]
   normal.family = "JetBrains Mono"
   size = 10

   [window]
   padding = { x = 8, y = 8 }

   [colors.primary]
   background = "#2e3440"
   foreground = "#eceff4"

   [colors.normal]
   black   = "#3b4252"
   red     = "#bf616a"
   green   = "#a3be8c"
   yellow  = "#ebcb8b"
   blue    = "#81a1c1"
   magenta = "#b48ead"
   cyan    = "#88c0d0"
   white   = "#e5e9f0"

   [colors.bright]
   black   = "#4c566a"
   red     = "#bf616a"
   green   = "#a3be8c"
   yellow  = "#ebcb8b"
   blue    = "#81a1c1"
   magenta = "#b48ead"
   cyan    = "#8fbcbb"
   white   = "#eceff4"
   '';

  home.file.".config/i3/config".source = ../../modules/desktop/i3-config;

  home.file.".config/rofi/config.rasi".text = ''
   * {
     bg: #2e3440;
     bg-alt: #3b4252;
     fg: #4c566a;
     accent: #434c5e;
   }

   window {
     width: 30%;
     location: center;
     background-color: @bg;
     border: 2;
     border-color: @accent;
     border-radius: 6;
   }

   mainbox {
     padding: 8;
   }

   inputbar {
     children: [ prompt, entry ];
     background-color: @bg-alt;
     padding: 4;
     border-radius: 4;
   }

   entry {
     placeholder: " run...";
   }

   listview {
     lines: 8;
     spacing: 4;
   }

   element {
     padding: 6;
     border-radius: 4;
   }

   element selected {
     background-color: @accent;
     text-color: #000000;
   }

   prompt {
     text-color: @accent;
   }
   '';

  home.packages = with pkgs; [
    alacritty
    librewolf
    vesktop
    claws-mail
    mpv
    flameshot
    obs-studio
    zathura
    feh

    ripgrep
    fd
    bat
    btop
    eza
    fzf
    jq
    lazygit
    rofi
    
    nordzy-cursor-theme
    papirus-nord
    nordic

    lxrandr
    lxappearance
    
    pulseaudio
    wine
    wine64
    lutris
    protonup-qt
    mangohud
    mangojuice
  ];
  programs.steam.enable = true;
  programs.bash.enable = true;
  programs.git = {
    enable = true;
    settings = {
      user.name = "typirr";
      user.email = "typirr@example.com";
      init.defaultBranch = "main";
      credential.helper = "store";
      safe.directory = ["/etc/nixos"];
    };
  };
  programs.neovim = {
  enable = true;

  plugins = with pkgs.vimPlugins; [
    nord-nvim
    nvim-treesitter
  ];

  initLua = ''
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.termguicolors = true

    vim.cmd("colorscheme nord")
     '';
   };

  gtk = {
    enable = true;
  
    theme = {
      name = "Nordic-darker";
      package = pkgs.nordic;
    };
   
    iconTheme = {
      name = "Nordic-darker";
      package = pkgs.nordic;
    };
  
    cursorTheme = {
      name = "Nordzy-catpputccin-mocha-dark";
      package = pkgs.nordzy-cursor-theme;
      size = 24;
    };
  };

  home.stateVersion = "26.05";
}
