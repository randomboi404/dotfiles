{ inputs, ... }:
{
  perSystem =
    { pkgs, system, ... }:
    {
      formatter = inputs.treefmt-nix.lib.mkWrapper pkgs {
        programs.nixfmt = {
          enable = true;
          package = inputs.nixfmt-rs.packages.${system}.default;
        };
      };
    };

  system.nix = {
    nixos =
      { pkgs, flakePath, ... }:
      {
        imports = [ inputs.nix-index-database.nixosModules.nix-index ];

        nix = {
          settings = {
            experimental-features = [
              "nix-command"
              "flakes"
            ];
            use-xdg-base-directories = true;
          };

          optimise.automatic = true;

          gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 7d";
          };
        };

        environment.etc."NixOS-Config".source = flakePath;
        services.journald.extraConfig = "SystemMaxUse=50M";

        programs = {
          nix-index-database.comma.enable = true;
          nix-ld.enable = true;
        };

        documentation.man.cache.enable = true;
        services.envfs.enable = true;
        environment.systemPackages = [ pkgs.nh ];
      };
  };
}
