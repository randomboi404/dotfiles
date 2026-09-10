{ inputs, ... }:
let
  cursor = {
    name = "Bibata-Modern-Amber";
    package = pkgs: pkgs.bibata-cursors;
    size = 24;
  };
in
{
  desktop.stylix = {
    nixos =
      { pkgs, ... }:
      {
        imports = [ inputs.stylix.nixosModules.stylix ];

        stylix = {
          enable = true;
          polarity = "dark";
          autoEnable = false;

          base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

          # Fonts
          fonts = {
            sizes = {
              applications = 11;
              desktop = 9;
            };

              serif = {
                package = pkgs.eb-garamond;
                name = "EB Garamond";
              };
            sansSerif = {
              package = pkgs.inter;
              name = "Inter";
            };
            monospace = {
              package = pkgs.nerd-fonts.jetbrains-mono;
              name = "JetBrains Mono Nerd Font";
            };
            emoji = {
              package = pkgs.noto-fonts-color-emoji;
              name = "Noto Color Emoji";
            };
          };

          # Cursor theme
          cursor = {
            name = cursor.name;
            package = cursor.package pkgs;
            size = cursor.size;
          };

          targets = {
            font-packages.enable = true;
            fontconfig.enable = true;
          };
        };

        environment.systemPackages = [ (cursor.package pkgs) ];

        # Make sure X server can render mouse theme
        services.xserver.displayManager.setupCommands = ''
          ${pkgs.xrdb}/bin/xrdb -merge <<< "Xcursor.theme: ${cursor.name}"
                   ${pkgs.xrdb}/bin/xrdb -merge <<< "Xcursor.size: ${toString cursor.size}"
        '';
      };

    homeManager =
      { pkgs, ... }:
      {
        stylix = {
          enable = true;
          autoEnable = true;

          # Icons
          icons = {
            enable = true;
            dark = "Gruvbox-Plus-Dark";
            light = "Gruvbox-Plus-Dark";
            package = pkgs.gruvbox-plus-icons;
          };

          targets = {
            nixcord.enable = false;

            librewolf = {
              profileNames = [ "default" ];
              colorTheme.enable = true;
            };
          };
        };
      };
  };
}
