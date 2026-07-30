{
  services.kanata = {
    nixos = {
      services.kanata = {
        enable = true;

        keyboards.default.config = ''
          (defsrc
            caps esc
          )

          (deflayer base
            esc caps
          )
        '';
      };
    };
  };
}
