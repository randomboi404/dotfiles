{
  services,
  system,
  features,
  development,
  gaming,
  desktop,
  ...
}:
{
  den.hosts.x86_64-linux.nix-g15 = {
    users.rb4 = {
      gitUserName = "randomboi404";
      gitUserEmail = "tanishsawant603@gmail.com";
    };
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
    # lactYamlConfig = ./lact.yaml;
  };

  den.aspects.nix-g15 = {
    nixos = {
      imports = [
        ./_disk.nix
        ./_sensors.nix
      ];
    };

    includes = [
      system.network
      system.audio
      system.bluetooth
      system.boot
      system.locale
      system.nix
      system.xserver
      system.intel
      system.nvidia
      gaming.steam
      gaming.gamemode
      # gaming.gamescope
      gaming.heroic
      gaming.mangohud
      services.scx
      services.kanata
      services.awcc
      services.lact
      services.throttled
      services.undervolt
      features.containers
      features.ctl
      desktop.xfce
      desktop.fonts
      desktop.launcher.vicinae
      development.cpp
      # development.js
      # development.java
      # development.rust
    ];
  };
}
