{
  desktop.picom = {
    homeManager = {
      services.picom = {
        enable = true;

        backend = "glx";
        vSync = true;
        shadow = true;
        fade = true;
        fadeDelta = 10;

        activeOpacity = 1.0;
        inactiveOpacity = 0.8;

        settings = {
          fade-in-step = 0.08;
          fade-out-step = 0.08;

          use-damage = true;
          no-fading-openclose = true;
          shadow-radius = 12;

          blur = {
            method = "dual_kawase";
            strength = 5;
          };
        };
      };
    };
  };
}
