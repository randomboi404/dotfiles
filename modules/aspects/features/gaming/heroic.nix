{
  gaming.heroic = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [
          pkgs.heroic
        ];
      };
  };
}
