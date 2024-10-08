{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with inputs;
    [
      catppuccin-whiskers.packages.${pkgs.system}.whiskers
      catppuccin-catwalk.packages.${pkgs.system}.catwalk
    ]
    ++ (with pkgs; [
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
      # TUI
      peaclock
      # GUI
      speedcrunch # calculator
      eog # eye of gnome
      libreoffice
      calibre # ebooks
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
      cargo
      rustc
      gcc # needed for rust-analyzer
      direnv
    ]);
}
