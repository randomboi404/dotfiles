{ inputs, den, ... }:
{
  imports = map (name: inputs.den.namespace name true) [
    "apps"
    "desktop"
    "services"
    "hardware"
    "tools"
    "system"
    "development"
    "gaming"
    "features"
  ];

  _module.args.__findFile = den.lib.__findFile;
}
