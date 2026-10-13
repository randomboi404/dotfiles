{
  desktop.wm.i3 = {
    nixos = {
      services.xserver.windowManager.i3.enable = true;
    };

    homeManager = { pkgs, config, ... }: {
      programs.i3status-rust = {
        enable = true;

        bars = {
          main = {
            theme = "plain";
            icons = "awesome5";

            settings = {
              theme.overrides = config.lib.stylix.i3status-rust.bar;
              icons = {
                icons = "awesome5";
              };
            };

            blocks = [
              {
                block = "cpu";
                interval = 2;
                format = " $barchart ";
              }
              {
                block = "disk_space";
                path = "/";
                info_type = "available";
                interval = 30;
                warning = 20.0;
                alert = 10.0;
                format = " $icon $available.eng(w:2) ";
              }
              {
                block = "net";
                interval = 5;
                format = " $icon {$signal_strength $ssid|Wired} ";
              }
              {
                block = "battery";
                interval = 30;
                format = " $icon $percentage ";
                not_charging_format = " $icon $percentage ";
              }
              {
                block = "sound";
                format = " $icon {$volume.eng(w:2)|muted} ";
                click = [
                  {
                    button = "left";
                    cmd = "ctl audio mute-tg";
                  }
                  {
                    button = "wheel_up";
                    cmd = "ctl audio inc";
                  }
                  {
                    button = "wheel_down";
                    cmd = "ctl audio dec";
                  }
                ];
              }
              {
                block = "backlight";
                device = "intel_backlight";
                format = " $icon $brightness ";
                click = [
                  {
                    button = "left";
                    cmd = "ctl bright dec";
                  }
                  {
                    button = "right";
                    cmd = "ctl bright inc";
                  }
                ];
              }
              {
                block = "time";
                interval = 5;
                format = " $icon $timestamp.datetime(f:'%a %d %b %H:%M') ";
              }
            ];
          };
        };
      };

      xsession.windowManager.i3 = {
        enable = true;

        config = {
          terminal = "kitty";

          startup = [
            {
              command = "sh -c 'for i in 1 2 3 4 5; do i3-msg --quiet \"workspace number 1\" && exit 0; sleep 0.5; done'";
              notification = false;
            }
          ];

          bars = [
            (
              {
                position = "top";
                mode = "dock";
                workspaceButtons = true;
                workspaceNumbers = true;

                trayOutput = "primary";
                trayPadding = 6;

                statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs \$HOME/.config/i3status-rust/config-main.toml";
              }
              // config.stylix.targets.i3.exportedBarConfig
              // {
                fonts = {
                  names = [
                    "JetBrainsMono Nerd Font"
                    "Noto Color Emoji"
                  ];
                  size = 9.0;
                };
              }
            )
          ];

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
