{
  desktop.appearance.gtk =
    let
      cursorTheme = {
        name = "Bibata-Modern-Amber";
        package = pkgs: pkgs.bibata-cursors;
        size = 24;
      };

      gtkTheme = {
        name = "Gruvbox-Dark";
        package =
          pkgs:
          pkgs.gruvbox-gtk-theme.override {
            themeVariants = [ "all" ];
            colorVariants = [
              "dark"
              "light"
            ];
            tweakVariants = [
              "outline"
              "float"
            ];
          };
      };

      iconTheme = {
        name = "Gruvbox-Plus-Dark";
        package = pkgs: pkgs.gruvbox-plus-icons;
      };
    in
    {
      nixos =
        { pkgs, ... }:
        {
          programs.dconf.enable = true;

          environment.systemPackages = [ (cursorTheme.package pkgs) ];

          services.xserver.displayManager.setupCommands = ''
            ${pkgs.xrdb}/bin/xrdb -merge <<< "Xcursor.theme: ${cursorTheme.name}"
            ${pkgs.xrdb}/bin/xrdb -merge <<< "Xcursor.size: ${toString cursorTheme.size}"
          '';
        };

      homeManager =
        { pkgs, ... }:
        {
          home.pointerCursor = {
            enable = true;
            name = cursorTheme.name;
            package = cursorTheme.package pkgs;
            size = cursorTheme.size;
            gtk.enable = true;
            x11.enable = true;
          };

          gtk = {
            enable = true;
            theme = {
              name = gtkTheme.name;
              package = gtkTheme.package pkgs;
            };
            iconTheme = {
              name = iconTheme.name;
              package = iconTheme.package pkgs;
            };
            gtk3.extraConfig = {
              gtk-application-prefer-dark-theme = true;
            };
            gtk4.extraConfig = {
              gtk-application-prefer-dark-theme = true;
            };
          };

          qt = {
            enable = true;
            platformTheme.name = "gtk3";
            style.name = "adwaita-dark";
          };
        };
    };
}
