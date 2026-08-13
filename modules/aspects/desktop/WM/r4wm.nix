{ inputs, ... }:
{
  desktop.wm.r4wm = {
    nixos =
      { pkgs, ... }:
      {
        services.xserver.windowManager.session = [
          {
            name = "r4wm";
            start = ''
              ${inputs.r4wm.packages.${pkgs.system}.default}/bin/nwm &
              waitPID=$!
            '';
          }
        ];

        environment.systemPackages = [ inputs.r4wm.packages.${pkgs.system}.default ];
      };
  };
}
