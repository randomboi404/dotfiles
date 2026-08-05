{
  apps.pwvucontrol = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          pwvucontrol
        ];
      };
  };
}
