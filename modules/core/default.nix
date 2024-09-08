{lib, ...}: {
  imports = [
    ./user.nix
    ./system.nix
    ./catppuccin.nix
    ./pipewire.nix
    ./fonts.nix
    ./network.nix
    ./bootloader.nix
    ./security.nix
    ./bluetooth.nix
    ./programs.nix
    ./services.nix
  ];

  bootloader.enable = lib.mkDefault true;
}
