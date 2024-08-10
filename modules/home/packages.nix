{ inputs, pkgs, ... }:
{
  home.packages = (with pkgs; [
    pkgs.xdg-desktop-portal-hyprland
    pkgs.hyprlock
    pkgs.hypridle
    pkgs.hyprpaper
    pkgs.hyprpicker
    pkgs.hyprcursor
    # Core
    pkgs.firefox
    pkgs.keepassxc
    pkgs.gnome.nautilus
    pkgs.gparted
    pkgs.blueman
    # Programming
    pkgs.kitty
    pkgs.vscode
    # Fun
    pkgs.prismlauncher
    pkgs.vesktop
    pkgs.aseprite
    # Work
    pkgs.obsidian
    pkgs.activitywatch
    # CLI
    pkgs.tldr
    pkgs.fastfetch
    pkgs.just
    # Screen
    pkgs.grim
    pkgs.slurp
    pkgs.wl-clipboard
    pkgs.ddcutil
    pkgs.brightnessctl
  ]);
}