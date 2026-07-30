{
  services.scx = {
    nixos =
      { ... }:
      {
        services.scx = {
          enable = true;
          scheduler = "scx_lavd";
        };
      };
  };
}
