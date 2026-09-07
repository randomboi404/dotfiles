{
  apps.fdm = {
    homeManager =
      { pkgs, lib, ... }:
      let
        freedownloadmanager = pkgs.stdenv.mkDerivation rec {
          pname = "freedownloadmanager";
          version = "6.34.4.6974";

          src = pkgs.fetchurl {
            url = "http://debrepo.freedownloadmanager.org/pool/main/f/freedownloadmanager/freedownloadmanager_${version}_amd64.deb";
            hash = "sha256-KZxb7xgLV4riI+A6EIJ5w7gOx/m84+F5JGnUbe4vxs0=";
          };

          unpackPhase = "dpkg-deb -x $src .";

          nativeBuildInputs = [
            pkgs.dpkg
            pkgs.autoPatchelfHook
            pkgs.qt6.wrapQtAppsHook
          ];

          buildInputs = [
            pkgs.libdrm
            pkgs.libpqxx
            pkgs.unixodbc
            pkgs.stdenv.cc.cc
            pkgs.libtiff
            pkgs.libxcb-cursor
            pkgs.libxcb-wm
            pkgs.libxcb-image
            pkgs.libxcb-keysyms
            pkgs.libxcb-render-util
            pkgs.libpulseaudio
            pkgs.qt6.qtbase
            pkgs.gtk3
            pkgs.pango
            pkgs.atk
            pkgs.cairo
            pkgs.gdk-pixbuf
          ]
          ++ (with pkgs.gst_all_1; [
            gstreamer
            gst-libav
            gst-plugins-base
            gst-plugins-good
            gst-plugins-bad
            gst-plugins-ugly
          ]);

          autoPatchelfIgnoreMissingDeps = [
            "libclntsh.so.23.1"
            "libmimerapi.so"
            "libfbclient.so.2"
            "libmysqlclient.so.21"
          ];

          preFixup = ''
            qtWrapperArgs+=(
              --prefix QT_PLUGIN_PATH : "$out/freedownloadmanager/plugins"
              --prefix QML2_IMPORT_PATH : "$out/freedownloadmanager/qml"
            )
          '';

          installPhase = ''
            mkdir -p $out/bin
            mkdir -p $out/share/applications
            cp -r opt/freedownloadmanager $out
            cp -r usr/share $out
            ln -s $out/freedownloadmanager/fdm $out/bin/${pname}

            ln -s ${lib.getLib pkgs.libtiff}/lib/libtiff.so $out/freedownloadmanager/lib/libtiff.so.5

            substituteInPlace $out/share/applications/freedownloadmanager.desktop \
              --replace-fail 'Exec=/opt/freedownloadmanager/fdm' 'Exec=${pname}' \
              --replace-warn "Icon=/opt/freedownloadmanager/icon.png" "Icon=$out/freedownloadmanager/icon.png"
          '';

          meta = with lib; {
            description = "A smart and fast internet download manager";
            homepage = "https://www.freedownloadmanager.org";
            license = licenses.unfree;
            platforms = [ "x86_64-linux" ];
          };
        };
      in
      {
        home.packages = [ freedownloadmanager ];
      };
  };
}
