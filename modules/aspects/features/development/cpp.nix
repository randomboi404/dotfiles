{
  development.cpp = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          jetbrains.clion
          cmake
          gcc
        ];
      };
  };
}
