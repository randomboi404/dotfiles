{
  gaming.heroic = {
    nixos =
      { config, ... }:
      {
        environment.systemPackages = [
          config.multiverse.instance.latest.heroic
        ];
      };
  };
}
