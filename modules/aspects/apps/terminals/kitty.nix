{
  apps.kitty = {
    homeManager = {
      programs.kitty = {
        enable = true;

        settings = {
          confirm_os_window_close = 0;
          font_size = 12;
          window_padding_width = 20;

          cursor_trail = 3;
          cursor_trail_decay = "0.1 0.4";

          enabled_layouts = "splits";
          tab_bar_style = "powerline";
          tab_powerline_style = "slanted";
        };
      };

      dconf.settings."org/cinnamon/desktop/applications/terminal" = {
        exec = "kitty";
      };
    };
  };
}
