{
  apps.mpv = {
    homeManager = {
      programs.mpv = {
        enable = true;
        config = {
          vo = "gpu-next";
          gpu-api = "vulkan";
          hwdec = "auto";
        };
      };
    };
  };
}
