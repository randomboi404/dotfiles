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

        activeOpacity = 0.95;
        inactiveOpacity = 0.75;

        opacityRules = [ "100:fullscreen" ];

        settings = {
          corner-radius = 12;
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
