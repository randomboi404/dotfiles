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

          loader.systemd-boot.enable = false;

          loader.efi.canTouchEfiVariables = true;

          kernelPackages = pkgs.linuxPackages_zen;

          blacklistedKernelModules = [
            "intel_ish_ipc"
            "intel_ishtp"
            "intel_ishtp_hid"

            "hid_sensor_hub"
            "hid_sensor_accel_3d"
            "hid_sensor_gyro_3d"
            "hid_sensor_als"
            "hid_sensor_prox"
            "hid_sensor_custom"
            "hid_sensor_trigger"
            "hid_sensor_iio_common"
          ];

          initrd.availableKernelModules = [
            "xhci_pci"
            "nvme"
            "usbhid"
            "usb_storage"
            "sd_mod"
          ];

          kernelModules = [ "kvm-intel" ];
        };

        hardware.sensor.iio.enable = false;
      };
  };
}
