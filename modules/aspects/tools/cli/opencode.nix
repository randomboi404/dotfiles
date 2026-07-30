{
  tools.opencode = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          opencode
          mcp-nixos
        ];
      };

    homeManager = {
      xdg.configFile."opencode/opencode.json".text = builtins.toJSON {
        "$schema" = "https://opencode.ai/config.json";
        mcp.nixos = {
          type = "local";
          command = [ "mcp-nixos" ];
          enabled = true;
        };
      };
    };
  };
}
