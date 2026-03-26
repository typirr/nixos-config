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

  home.file.".config/i3/config".source = ./i3-config;
  
  home.file.".config/rofi/config.rasi".text = ''
   * {
     bg: #2e3440;
     bg-alt: #3b4252;
     fg: #eceff4;
     accent: #88c0d0;
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
     padding: 10;
   }

   inputbar {
     children: [ prompt, entry ];
     background-color: @bg-alt;
     padding: 6;
     border-radius: 4;
   }

   entry {
     placeholder: "run...";
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
    mpv
    flameshot
    obs-studio
    zathura
    feh

    ripgrep
    fd
    bat
    eza
    fzf
    jq

    rofi
    
    yaru-theme
    papirus-icon-theme

    lxrandr
  ];

  programs.bash.enable = true;
  programs.git = {
    enable = true;

    userName = "typirr";
    userEmail = "typirr@example.com";

    extraConfig = {
      init.defaultBranch = "main";
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
      name = "Yaru-dark";
      package = pkgs.yaru-theme;
    };
   
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  
    cursorTheme = {
      name = "Yaru";
      package = pkgs.yaru-theme;
      size = 24;
    };
  };

  home.stateVersion = "26.05";
}
