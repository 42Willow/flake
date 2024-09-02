{pkgs, ...}: {
  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
    hyprlock
    hypridle
    hyprpicker
    hyprcursor
    # Core
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
    playerctl
    pandoc
    # GUI
    speedcrunch # calculator
    eog # eye of gnome
    libreoffice
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
    # Build tools
    nodejs
    nodePackages.npm
    nodePackages.pnpm
    devenv
    mdbook
    rustup
  ];
}
