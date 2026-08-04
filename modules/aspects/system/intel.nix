{
  system.intel = {
    nixos = {
      hardware.cpu.intel.updateMicrocode = true;

      boot.kernelModules = [ "kvm-intel" ];

      # Allows tools like mangohud get cpu wattage with trade-off of allowing platypus vulneribility
      systemd.tmpfiles.rules = [
        "z /sys/class/powercap/intel-rapl:0/energy_uj 0444 root root -"
      ];
    };
  };
}
