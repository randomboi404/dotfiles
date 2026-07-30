{
  development.js = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          bun
          nodejs
          jetbrains.webstorm
        ];
      };
  };
}
