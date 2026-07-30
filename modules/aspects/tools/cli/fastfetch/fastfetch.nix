{ den, ... }:
{
  tools.fastfetch = {
    homeManager =
      { lib, ... }:
      {
        programs.fastfetch = {
          enable = true;
          settings = lib.importJSON ./config.jsonc;
        };
      };
  };
}
