{
  desktop.login.lightdm = {
    nixos = {
      services.xserver.displayManager.lightdm.enable = true;
    };
  };
}
