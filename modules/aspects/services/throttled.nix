{ inputs, ... }:
{
  services.throttled = {
    nixos = {
      services.throttled = {
        enable = true;
        extraConfig = ''
          [GENERAL]
          Enabled: True

          [BATTERY]
          Update_Rate_s: 30
          PL1_Tdp_W: 15
          PL1_Duration_s: 28
          PL2_Tdp_W: 30
          PL2_Duration_S: 3
          Trip_Temp_C: 80
          Disable_BDPROCHOT: True

          [AC]
          Update_Rate_s: 3
          PL1_Tdp_W: 35
          PL1_Duration_s: 28
          PL2_Tdp_W: 60
          PL2_Duration_S: 16
          Trip_Temp_C: 85
          Disable_BDPROCHOT: True
        '';
      };
    };
  };
}
