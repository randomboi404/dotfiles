{
  desktop.de.xfce = {
    nixos = {
      services.xserver.desktopManager = {
        xterm.enable = false;
        xfce.enable = true;
      };
    };
  };
}
