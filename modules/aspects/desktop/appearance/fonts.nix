{ inputs, ... }:
{
  desktop.fonts = {
    nixos =
      { pkgs, ... }:
      {
        fonts = {
          enableDefaultPackages = true;
          packages = with pkgs; [
            eb-garamond
            inter
            nerd-fonts.jetbrains-mono
            noto-fonts-color-emoji
            noto-fonts-cjk-sans
            noto-fonts-cjk-serif
          ];

          fontconfig = {
            enable = true;
            useEmbeddedBitmaps = true;
            defaultFonts = {
              serif = [ "EB Garamond" ];
              sansSerif = [ "Inter" ];
              monospace = [ "JetBrains Mono Nerd Font" ];
              emoji = [ "Noto Color Emoji" ];
            };
          };
        };
      };
  };
}
