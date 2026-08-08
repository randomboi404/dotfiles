{
  apps.blueman = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          blueman
        ];
      };
  };
}
