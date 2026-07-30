{ den, lib, ... }:
{
  den.schema.user =
    { user, lib, ... }:
    {
      options.gitUserName = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
      };
      options.gitUserEmail = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
      };
    };

  tools.git =
    { user, ... }:
    {
      homeManager = {
        programs.git = {
          enable = true;
          settings = {
            user = {
              name = user.gitUserName;
              email = user.gitUserEmail;
            };
            init.defaultBranch = "main";
          };
        };
      };
    };
}
