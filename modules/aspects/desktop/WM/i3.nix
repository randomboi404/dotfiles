{
  desktop.wm.i3 = {
    nixos = {
      services.xserver.windowManager.i3.enable = true;
    };

    homeManager = {
      xsession.windowManager.i3 = {
        enable = true;

        config = {
          terminal = "kitty";

          bars = [ ];

          gaps = {
            inner = 10;
            outer = 5;
          };

          window = {
            border = 2;
            titlebar = false;
          };

          keybindings = {
            "Mod4+Return" = "exec kitty";
            "Mod4+q" = "kill";
            "Mod4+b" = "exec librewolf";
            "Mod4+f" = "exec nemo";
            "Mod1+Return" = "fullscreen toggle";
            "Mod4+a" = "exec vicinae toggle";
            "Mod4+Tab" = "workspace back_and_forth";
            "Mod4+Button4" = "focus prev";
            "Mod4+Button5" = "focus next";
            "Mod4+1" = "workspace number 1";
            "Mod4+2" = "workspace number 2";
            "Mod4+3" = "workspace number 3";
            "Mod4+4" = "workspace number 4";
            "Mod4+5" = "workspace number 5";
            "Mod4+6" = "workspace number 6";
            "Mod4+7" = "workspace number 7";
            "Mod4+8" = "workspace number 8";
            "Mod4+9" = "workspace number 9";
            "Mod4+0" = "workspace number 10";
            "Mod4+Shift+1" = "move container to workspace number 1";
            "Mod4+Shift+2" = "move container to workspace number 2";
            "Mod4+Shift+3" = "move container to workspace number 3";
            "Mod4+Shift+4" = "move container to workspace number 4";
            "Mod4+Shift+5" = "move container to workspace number 5";
            "Mod4+Shift+6" = "move container to workspace number 6";
            "Mod4+Shift+7" = "move container to workspace number 7";
            "Mod4+Shift+8" = "move container to workspace number 8";
            "Mod4+Shift+9" = "move container to workspace number 9";
            "Mod4+Shift+0" = "move container to workspace number 10";
            "XF86AudioRaiseVolume" = "exec ctl audio inc";
            "XF86AudioLowerVolume" = "exec ctl audio dec";
            "XF86AudioMute" = "exec ctl audio mute-tg";
            "XF86MonBrightnessUp" = "exec ctl bright inc";
            "XF86MonBrightnessDown" = "exec ctl bright dec";
            "Print" = "exec flameshot full -p ~/Pictures/Screenshots -c";
            "Mod4+p" = "exec flameshot gui -c";
          };
        };
      };
    };
  };
}
