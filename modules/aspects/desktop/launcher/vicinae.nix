{
  desktop.launcher.vicinae = {
    homeManager =
      { pkgs, ... }:
      {
        programs.vicinae = {
          enable = true;
          systemd = {
            enable = true;
            autoStart = true;
          };
        };
      };
  };
}
