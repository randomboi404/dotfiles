{
  system.network = {
    nixos =
      { lib, ... }:
      {
        hardware.enableRedistributableFirmware = true;
        networking = {
          networkmanager.enable = true;
          wireless.enable = true;
        };

        systemd.services.NetworkManager-wait-online.wantedBy = lib.mkForce [ ];
      };
  };
}
