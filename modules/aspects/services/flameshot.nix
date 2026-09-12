{
  services.flameshot = {
    homeManager = {
      services.flameshot = {
        enable = true;

        settings.General = {
          disabledTrayIcon = true;
          showStartupLaunchMessage = false;
          showDesktopNotification = false;
          showAbortNotification = false;
          showSidePanelButton = true;
          useX11LegacyScreenshot = true;
          captureActiveMonitor = true;
        };
      };
    };
  };
}
