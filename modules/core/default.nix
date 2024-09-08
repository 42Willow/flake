{lib, ...}: {
  imports = [
    ./user.nix
    ./system.nix
    ./catppuccin.nix
    ./pipewire.nix
    ./fonts.nix
    ./network.nix
    ./programs.nix
    ./services.nix
    ./hyprland.nix
  ];

  bootloader.enable = lib.mkDefault true;
}
