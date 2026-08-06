{
  desktop.xfce = {
    nixos = {
      services.xserver = {
        enable = true;
        displayManager.lightdm.enable = true;
        desktopManager = {
          xterm.enable = false;
          xfce.enable = true;
        };
      };
    };
  };
}
