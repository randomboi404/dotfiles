{
  apps.nwg-look = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          nwg-look
        ];
      };
  };
}