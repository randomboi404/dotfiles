{
  desktop.launcher.vicinae = {
    homeManager = {
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
