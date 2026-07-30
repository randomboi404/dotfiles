{
  tools.neovim = {
    homeManager = {
      programs.nixvim.colorschemes = {
        catppuccin = {
          enable = true;
          settings = {
            favour = "mocha";
          };
        };
      };
    };
  };
}
