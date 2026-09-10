{
  den.schema.user =
    { lib, ... }:
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
      homeManager =
        { lib, ... }:
        {
          programs.git = {
            enable = true;
            settings = {
              user = {
                name = lib.mkIf (user.gitUserName != null) user.gitUserName;
                email = lib.mkIf (user.gitUserEmail != null) user.gitUserEmail;
              };
              init.defaultBranch = "main";
            };
          };
        };
    };
}
