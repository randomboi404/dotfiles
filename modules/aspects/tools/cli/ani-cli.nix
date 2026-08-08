{
  tools.ani-cli = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          ani-cli
        ];
      };
  };
}
