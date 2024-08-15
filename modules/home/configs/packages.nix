{pkgs, ...}: {
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
    nautilus
    gparted
    polkit_gnome
    # Programming
    kitty
    vscode
    # Procrastination
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
    killall
    # Nix Formatter
    alejandra
    statix
    deadnix
    # Screen
    grim
    slurp
    wl-clipboard
    ddcutil
    brightnessctl
  ];
}
