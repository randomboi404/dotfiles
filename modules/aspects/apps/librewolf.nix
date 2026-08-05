{
  apps.librewolf = {
    homeManager = {
      programs.librewolf = {
        enable = true;
        settings = {
          "privacy.resistFingerprinting" = false;
          "webgl.disabled" = false;
          "librewolf.webgl.prompt" = false;
          "identity.fxaccounts.enabled" = true;
          "middlemouse.paste" = false;
          "general.autoScroll" = true;
          "widget.gtk.libadwaita-colors.enabled" = false;
        };
      };

      xdg.mimeApps = {
        enable = true;
        defaultApplications = {
          "text/html" = "librewolf.desktop";
          "x-scheme-handler/http" = "librewolf.desktop";
          "x-scheme-handler/https" = "librewolf.desktop";
        };
      };
    };
  };
}
