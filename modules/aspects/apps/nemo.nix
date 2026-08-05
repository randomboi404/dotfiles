{
  apps.nemo = {
    homeManager =
      { pkgs, ... }:
      let
        gtkhash-with-nemo = pkgs.gtkhash.overrideAttrs (old: {
          buildInputs = old.buildInputs ++ [ pkgs.nemo ];
          mesonFlags = [ "-Dbuild-nemo=true" ];
          env.PKG_CONFIG_LIBNEMO_EXTENSION_EXTENSIONDIR = "${builtins.placeholder "out"}/lib/nemo/extensions-3.0";
        });
        nemo = pkgs.nemo-with-extensions.override {
          useDefaultExtensions = false;
          extensions = with pkgs; [
            nemo-preview
            nemo-fileroller
            folder-color-switcher
            nemo-emblems
            gtkhash-with-nemo
          ];
        };
      in
      {
        home.packages = [ nemo ];

        xdg.desktopEntries.nemo = {
          name = "Nemo";
          exec = "${nemo}/bin/nemo";
        };
        xdg.mimeApps = {
          enable = true;
          defaultApplications = {
            "inode/directory" = [ "nemo.desktop" ];
            "application/x-gnome-saved-search" = [ "nemo.desktop" ];
          };
        };
      };
  };
}
