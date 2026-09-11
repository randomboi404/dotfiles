{
  desktop.wm.i3 = {
    nixos = {
      services.xserver.windowManager.i3 = {
        enable = true;

        config = {
          terminal = "kitty";

          keybindings = {
            "Mod4+b" = "exec librewolf";
            "Mod4+f" = "exec nemo";
            "Mod1+Return" = "fullscreen toggle";
            "Mod4+a" = "exec vicinae toggle";
            "Mod4+Tab" = "workspace prev";
            "Mod4+Button4" = "workspace prev";
            "Mod4+Button5" = "workspace next";
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
