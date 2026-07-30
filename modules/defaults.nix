{
  lib,
  den,
  self,
  ...
}:
{
  den.default.nixos.system.stateVersion = "26.05";
  den.default.homeManager.home.stateVersion = "26.05";

  den.default.nixos.nixpkgs.config.allowUnfree = true;
  den.default.homeManager.nixpkgs.config.allowUnfree = true;

  den.default.nixos._module.args.flakePath = self.sourceInfo.outPath;
  den.default.homeManager._module.args.flakePath = self.sourceInfo.outPath;

  den.default.includes = [
    den.batteries.hostname
    den.batteries.inputs'
  ];

  den.schema.user.classes = lib.mkDefault [ "homeManager" ];

  _module.args.__findFile = den.lib.__findFile;
}
