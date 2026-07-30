{ inputs, ... }:
{
  services.awcc = {
    nixos =
      { config, ... }:
      {
        imports = [ inputs.awcc.nixosModules.default ];

        services.awcc.enable = true;

        boot.kernelModules = [ "acpi_call" ];
        boot.extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
      };
  };
}
