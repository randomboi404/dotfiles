{
  boot = {
    # Disable unnecessary sensors which cause some bugs
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
  };

  hardware.sensor.iio.enable = false;
}
