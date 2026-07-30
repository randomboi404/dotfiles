{ inputs, ... }: {
  desktop.stylix = {
    nixos =
      { pkgs, ... }:
      {
        imports = [ inputs.stylix.nixosModules.stylix ];

        stylix = {
          enable = true;

          base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
          polarity = "dark";
        };
      };

    homeManager = {
      stylix.targets = {
        librewolf.profileNames = [ "default" ];
        qt.platform = "qtct";
      };
    };
  };
}
