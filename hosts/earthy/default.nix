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
}
