# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  config,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  fileSystems."/run/media/arch" = {
    device = "/dev/disk/by-uuid/17a0b73e-30de-424f-9f3c-44294696695a";
    fsType = "btrfs";
  };
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents
  services.printing.enable = true;
}
