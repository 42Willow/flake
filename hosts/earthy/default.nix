{pkgs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  fileSystems."/run/media/arch" = {
    device = "/dev/disk/by-uuid/17a0b73e-30de-424f-9f3c-44294696695a";
    fsType = "btrfs";
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
    ];
  };

  services.tlp = {
    enable = true;
    settings = {
      CPU_ENERGY_PERF_POLICY_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low-power";
    };
  };
}
