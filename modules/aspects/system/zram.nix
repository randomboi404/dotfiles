{
  system.zram = {
    nixos = {
      zramSwap = {
        enable = true;
        algorithm = "zstd";
        memoryPercent = 100;
        priority = 100;
      };

      # kernel's native OOM killer can fail sometimes so use systemd-oomd
      systemd.oomd.enable = true;
    };
  };
}
