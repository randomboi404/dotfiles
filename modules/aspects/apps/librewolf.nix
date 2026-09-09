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
