{
  tools.neovim = {
    homeManager = {
      programs.nixvim.plugins.lsp = {
        enable = true;
        servers = {
          rust_analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };

          nixd = {
            enable = true;
            settings = {
              nixpkgs.expr = "import <nixpkgs> {}";
            };
          };
        };
      };
    };
  };
}
