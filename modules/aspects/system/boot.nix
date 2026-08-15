{
  system.boot = {
    nixos =
      { pkgs, ... }:
      {
        boot = {
          loader.grub = {
            enable = true;
            device = "nodev";
            efiSupport = true;
          };
          loader.efi.canTouchEfiVariables = true;
          loader.timeout = 3;

          kernelPackages = pkgs.linuxPackages_zen;

          initrd.systemd.enable = true;

          consoleLogLevel = 3;
          initrd.verbose = false;
          kernelParams = [
            "quiet"
            "rd.udev.log_level=3"
            "rd.systemd.show_status=auto"
            "8250.nr_uarts=0"
            "split_lock_detect=off"
          ];
        };
      };
  };
}
