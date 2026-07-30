{
  tools.neovim = {
    homeManager = {
      programs.nixvim.opts = {
        number = true;
        relativenumber = true;

        shiftwidth = 2;
      };
    };
  };
}
