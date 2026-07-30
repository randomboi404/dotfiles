{ inputs, ... }:
{
  apps.obsidian = {
    homeManager =
      { pkgs, ... }:
      {
        programs.obsidian = {
          enable = true;

          defaultSettings = {
            app = {
              vimMode = true;
            };
          };
        };
      };
  };
}
