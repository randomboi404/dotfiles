{ inputs, ... }:
{
  tools.neovim = {
    homeManager = {
      imports = [
        inputs.nixvim.homeModules.nixvim
      ];

      programs.nixvim.enable = true;
    };
  };
}
