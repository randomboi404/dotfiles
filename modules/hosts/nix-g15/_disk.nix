{ config, lib, ... }:
{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/09dc578c-5e25-4baf-94cf-e8588819a0cc";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/7E66-D064";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };
}
