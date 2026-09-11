{
  services.flameshot = {
    homeManager = {
      services.flameshot = {
        enable = true;

        settings.General = {
          disabledTrayIcon = true;
          showStartupLaunchMessage = false;
          showDesktopNotifications = false;
          showAbortNotifications = false;
          showSidePanel = true;
          useX11LegacyScreenshot = true;
          captureActiveMonitor = true;
        };
      };
    };
  };
}
