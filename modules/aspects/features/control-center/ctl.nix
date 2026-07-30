{
  features.ctl = {
    nixos =
      { pkgs, ... }:
      let
        ctl = pkgs.rustPlatform.buildRustPackage {
          pname = "ctl";
          version = "0.1.0";
          src = ./ctl;

          nativeBuildInputs = with pkgs; [ autoPatchelfHook ];

          buildInputs = with pkgs; [
            libpulseaudio
          ];

          cargoHash = "sha256-GpD7hHBVcn+Ak/RNun/u1AE+cJ1yuPPPGmiRohLXH9k=";
        };
      in
      {
        environment.systemPackages = [
          ctl
          pkgs.libpulseaudio
        ];
      };
  };
}
