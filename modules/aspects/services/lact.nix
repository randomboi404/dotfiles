{
  den.schema.host =
    { lib, ... }:
    {
      options.lactYamlConfig = lib.mkOption {
        type = lib.types.nullOr lib.types.path;
        default = null;
      };
    };

  services.lact =
    { host, ... }:
    {
      nixos =
        { pkgs, ... }:
        let
          importYAML =
            file:
            builtins.fromJSON (
              builtins.readFile (
                pkgs.runCommand "lact-config.json" { } ''
                  ${pkgs.yj}/bin/yj -yj < "${file}" > "$out"
                ''
              )
            );
          lactSettings = if host.lactYamlConfig != null then importYAML host.lactYamlConfig else { };
        in
        {
          services.lact = {
            enable = true;
            settings = lactSettings;
          };
        };
    };
}
