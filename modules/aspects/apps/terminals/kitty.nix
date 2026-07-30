{
  apps.kitty = {
    homeManager = { pkgs, ... }: {
      programs.kitty = {
        enable = true;

        settings = {
          hide_window_decorations = "yes";
          confirm_os_window_close = 0;
          window_padding_width = 20;

          cursor_trail = 3;
          cursor_trail_decay = "0.1 0.4";

          enabled_layouts = "splits";
          tab_bar_style = "powerline";
          tab_powerline_style = "slanted";
        };

        themeFile = "Twilight";
      };
    };
  };
}
