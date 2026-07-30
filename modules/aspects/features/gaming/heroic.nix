{
  gaming.heroic = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          heroic
        ];
      };
  };
}
