{ inputs, ... }:
{
  apps.discord = {
    homeManager = {
      imports = [ inputs.nixcord.homeModules.nixcord ];

      programs.nixcord = {
        enable = true;
        discord.equicord.enable = true;

        config.plugins = {
          messageLogger.enable = true;
          fakeNitro.enable = true;
          disableCameras.enable = true;
          googleThat.enable = true;
          homeTyping.enable = true;
          iRememberYou.enable = true;
          showHiddenChannels.enable = true;
          validReply.enable = true;
        };
      };
    };
  };
}
