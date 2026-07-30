{
  system.xserver = {
    nixos = {
      services.xserver = {
        enable = true;
        xkb = {
          layout = "us";
          variant = "";
        };
      };

      services.libinput.enable = true;
    };
  };
}
