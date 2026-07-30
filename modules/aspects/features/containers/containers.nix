{
  features.containers = {
    nixos = {
      virtualisation.podman = {
        enable = true;
        dockerCompat = true;
      };
    };

    homeManager =
      { config, pkgs, ... }:
      let
        box = pkgs.writers.writePython3Bin "box" { } (builtins.readFile ./box.py);
      in
      {
        home.packages = [ box ];

        programs.distrobox = {
          enable = true;

          containers.base-container = {
            image = "docker.io/greyltc/archlinux-aur";
            nvidia = true;
          };
        };
      };
  };
}
