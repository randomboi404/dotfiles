{
  den.schema.host =
    { lib, ... }:
    {
      options.intelBusId = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
      };
      options.amdgpuBusId = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
      };
      options.nvidiaBusId = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
      };
    };

  system.nvidia =
    { host, ... }:
    {
      nixos =
        {
          config,
          lib,
          ...
        }:
        {
          hardware.graphics = {
            enable = true;
            enable32Bit = true;
          };

          services.xserver.videoDrivers = [
            "nvidia"
          ];

          hardware.nvidia-container-toolkit.enable = true;

          hardware.nvidia = {
            open = true;
            package = config.boot.kernelPackages.nvidiaPackages.new_feature;

            modesetting.enable = true;

            powerManagement = {
              enable = true;
              finegrained = true;
            };

            dynamicBoost.enable = true;

            prime = {
              offload = {
                enable = true;
                enableOffloadCmd = true;
              };

              intelBusId = lib.mkIf (host.intelBusId != null) host.intelBusId;
              amdgpuBusId = lib.mkIf (host.amdgpuBusId != null) host.amdgpuBusId;
              nvidiaBusId = lib.mkIf (host.nvidiaBusId != null) host.nvidiaBusId;
            };
          };
        };
    };
}
