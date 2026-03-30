{ config, pkgs, ... }:
{
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = "Mod4";
      font = "pango:JetBrains Mono 10";

      exec = [
        "feh --bg-fill /etc/nixos/assets/walls/wall1.png"
        "dex --autostart --environment i3"
        "xss-lock --transfer-sleep-lock -- i3lock --nofork"
        "nm-applet"
      ];

      keybindings = let
        mod = config.xsession.windowManager.i3.config.modifier;
        refresh = "killall -SIGUSR1 i3status";
      in {
        "${mod}+Return" = "exec alacritty";
        "${mod}+Shift+q" = "kill";
        "${mod}+d" = "exec --no-startup-id rofi -show drun";
        "Print" = "exec flameshot gui";
        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5% && ${refresh}";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% && ${refresh}";
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && ${refresh}";
        "XF86AudioMicMute" = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && ${refresh}";
        "${mod}+j" = "focus left";
        "${mod}+k" = "focus down";
        "${mod}+l" = "focus up";
        "${mod}+semicolon" = "focus right";
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";
        "${mod}+Shift+j" = "move left";
        "${mod}+Shift+k" = "move down";
        "${mod}+Shift+l" = "move up";
        "${mod}+Shift+semicolon" = "move right";
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";
        "${mod}+h" = "split h";
        "${mod}+v" = "split v";
        "${mod}+f" = "fullscreen toggle";
        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";
        "${mod}+a" = "focus parent";
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";
        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+r" = "restart";
        "${mod}+Shift+e" = "exec \"i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'\"";
        "${mod}+r" = "mode \"resize\"";
      };

      modes = {
        resize = {
          j = "resize shrink width 10 px or 10 ppt";
          k = "resize grow height 10 px or 10 ppt";
          l = "resize shrink height 10 px or 10 ppt";
          semicolon = "resize grow width 10 px or 10 ppt";
          Left = "resize shrink width 10 px or 10 ppt";
          Down = "resize grow height 10 px or 10 ppt";
          Up = "resize shrink height 10 px or 10 ppt";
          Right = "resize grow width 10 px or 10 ppt";
          Return = "mode \"default\"";
          Escape = "mode \"default\"";
          "${mod}+r" = "mode \"default\"";
        };
      };

      colors = {
        focused = {
          border = "#88c0d0";
          background = "#88c0d0";
          text = "#000000";
          indicator = "#88c0d0";
          childBorder = "#88c0d0";
        };
        unfocused = {
          border = "#2e3440";
          background = "#2e3440";
          text = "#666666";
          indicator = "#2e3440";
          childBorder = "#2e3440";
        };
        focusedInactive = {
          border = "#3b4252";
          background = "#3b4252";
          text = "#aaaaaa";
          indicator = "#3b4252";
          childBorder = "#3b4252";
        };
        urgent = {
          border = "#bf616a";
          background = "#bf616a";
          text = "#ffffff";
          indicator = "#bf616a";
          childBorder = "#bf616a";
        };
      };

      window = {
        commands = [
          { command = "border pixel 2"; criteria = { class = "^.*$"; }; }
        ];
      };

      gaps = {
        inner = 6;
        outer = 2;
      };

      bar = {
        command = "i3bar";
        statusCommand = "i3status";
        colors = {
          background = "#2e3440";
          statusline = "#eceff4";
          separator = "#4c566a";
          focusedWorkspace = {
            border = "#88c0d0";
            background = "#88c0d0";
            text = "#000000";
          };
          activeWorkspace = {
            border = "#3b4252";
            background = "#3b4252";
            text = "#ffffff";
          };
          inactiveWorkspace = {
            border = "#2e3440";
            background = "#2e3440";
            text = "#888888";
          };
          urgentWorkspace = {
            border = "#bf616a";
            background = "#bf616a";
            text = "#ffffff";
          };
        };
      };
    };
  };
}
