{
  tools.anime4k = {
    homeManager =
      { pkgs, ... }:
      let
        shader = name: "${pkgs.anime4k}/${name}.glsl";

        modeA = [
          (shader "Anime4K_Clamp_Highlights")
          (shader "Anime4K_Restore_CNN_VL")
          (shader "Anime4K_Upscale_CNN_x2_VL")
          (shader "Anime4K_AutoDownscalePre_x2")
          (shader "Anime4K_AutoDownscalePre_x4")
          (shader "Anime4K_Upscale_CNN_x2_M")
        ];

        modeB = [
          (shader "Anime4K_Clamp_Highlights")
          (shader "Anime4K_Restore_CNN_Soft_VL")
          (shader "Anime4K_Upscale_CNN_x2_VL")
          (shader "Anime4K_AutoDownscalePre_x2")
          (shader "Anime4K_AutoDownscalePre_x4")
          (shader "Anime4K_Upscale_CNN_x2_M")
        ];

        modeC = [
          (shader "Anime4K_Clamp_Highlights")
          (shader "Anime4K_Upscale_Denoise_CNN_x2_VL")
          (shader "Anime4K_AutoDownscalePre_x2")
          (shader "Anime4K_AutoDownscalePre_x4")
          (shader "Anime4K_Upscale_CNN_x2_M")
        ];

        shaderList = list: builtins.concatStringsSep ":" list;
      in
      {
        programs.mpv = {
          bindings = {
            "CTRL+1" =
              ''no-osd change-list glsl-shaders set "${shaderList modeA}"; show-text "Anime4K: Mode A (HQ)"'';
            "CTRL+2" =
              ''no-osd change-list glsl-shaders set "${shaderList modeB}"; show-text "Anime4K: Mode B (HQ)"'';
            "CTRL+3" =
              ''no-osd change-list glsl-shaders set "${shaderList modeC}"; show-text "Anime4K: Mode C (HQ)"'';
            "CTRL+0" = "no-osd change-list glsl-shaders clr \"\"; show-text \"Anime4K: Disabled\"";
          };
        };
      };
  };
}
