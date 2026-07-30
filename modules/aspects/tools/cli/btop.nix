{
  tools.btop =
    { host, ... }:
    {
      homeManager =
        { lib, pkgs, ... }:
        {
          programs.btop = {
            enable = true;
            package = lib.mkIf (host.nvidiaBusId != null) pkgs.btop-cuda;

            settings = {
              vim_keys = true;

              update_ms = 500;
              proc_sorting = "cpu direct";
            };
          };
        };
    };
}
