{
  gaming.steam = {
    nixos =
      { pkgs, ... }:
      {
        programs.steam = {
          enable = true;
          gamescopeSession.enable = true;
        };
      };
  };
}
