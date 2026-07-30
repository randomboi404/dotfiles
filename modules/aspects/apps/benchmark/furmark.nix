{
  apps.furmark = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          furmark
        ];
      };
  };
}
