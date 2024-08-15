{...}: {
  imports = [
    ./user.nix
    ./system.nix
    ./catppuccin.nix
    ./pipewire.nix
    ./fonts.nix
    ./network.nix
    ./bootloader.nix
    ./security.nix
  ];
}
