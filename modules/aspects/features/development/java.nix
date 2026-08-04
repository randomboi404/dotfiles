{
  development.java = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          # TODO: remove once https://github.com/NixOS/nixpkgs/pull/546636 merges
          (jetbrains.idea.overrideAttrs (old: {
            buildInputs = old.buildInputs ++ [
              alsa-lib
              at-spi2-atk
              at-spi2-core
              atk
              cairo
              cups
              dbus
              libgbm
              libxcb
              libxcomposite
              libxdamage
              libxext
              libxfixes
              libxkbcommon
              libxrandr
              nspr
              nss
              pango
            ];
            postPatch = (old.postPatch or "") + ''
              if [ -e plugins/jcef-plugin/jcef/libjcef.so ]; then
                patchelf --set-rpath '$ORIGIN' plugins/jcef-plugin/jcef/libjcef.so
              fi
            '';
          }))
          jdk
          maven
          gradle
        ];
      };
  };
}
