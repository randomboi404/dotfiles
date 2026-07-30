{ den, ... }:
let
  ani-cli-fix =
    {
      lib,
      fetchFromGitHub,
      makeWrapper,
      stdenvNoCC,
      gnugrep,
      gnused,
      curl,
      openssl,
      ffmpeg,
      fzf,
      aria2,
      mpv,
      botan3,
    }:
    let
      runtimeInputs = [
        openssl
        gnugrep
        gnused
        curl
        fzf
        ffmpeg
        aria2
        mpv
        botan3
      ];
    in
    stdenvNoCC.mkDerivation {
      pname = "ani-cli";
      version = "4.15.0-fix";

      src = fetchFromGitHub {
        owner = "pystardust";
        repo = "ani-cli";
        rev = "fix";
        hash = "sha256-sB2hUNFZP3cyg1jQpKiCwxjSz7n4Ii9qG3lhB65LAS8=";
      };

      nativeBuildInputs = [ makeWrapper ];

      installPhase = ''
        runHook preInstall
        install -Dm755 ani-cli $out/bin/ani-cli
        wrapProgram $out/bin/ani-cli \
          --prefix PATH : ${lib.makeBinPath runtimeInputs}
        runHook postInstall
      '';

      meta = {
        homepage = "https://github.com/pystardust/ani-cli";
        description = "Cli tool to browse and play anime";
        license = lib.licenses.gpl3Plus;
        platforms = lib.platforms.unix;
        mainProgram = "ani-cli";
      };
    };
in
{
  tools.ani-cli = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [
          (pkgs.callPackage ani-cli-fix { })
        ];
      };
  };
}
