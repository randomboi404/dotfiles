{ inputs, ... }:
{
  desktop.login.sddm = {
    nixos = {
      imports = [ inputs.qylock.nixosModules.default ];

      services.displayManager.sddm.enable = true;

      programs.qylock = {
        enable = true;
        theme = "pixel-night-city";
      };
    };
  };
}
