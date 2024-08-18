# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  fileSystems."/run/media/arch" = {
    device = "/dev/disk/by-uuid/17a0b73e-30de-424f-9f3c-44294696695a";
    fsType = "btrfs";
  };
}
