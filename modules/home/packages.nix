{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
    hyprlock
    hypridle
    hyprpaper
    hyprpicker
    hyprcursor
    # Core
    firefox
    keepassxc
    gnome.nautilus
    gparted
    blueman
    # Programming
    kitty
    vscode
    # Fun
    prismlauncher
    vesktop
    aseprite
    # Work
    obsidian
    activitywatch
    # CLI
    tldr
    fastfetch
    just
    alejandra
    # Screen
    grim
    slurp
    wl-clipboard
    ddcutil
    brightnessctl
  ];
}
