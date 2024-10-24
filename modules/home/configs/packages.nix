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
      # Programming
      kitty
      vscode
      # Procrastination
      prismlauncher
      vesktop
      aseprite
      # Work
      obsidian
      logseq
      # CLI
      tldr
      fastfetch
      just
      killall
      playerctl
      # TUI
      peaclock
      # GUI
      speedcrunch # calculator
      keepassxc
      gparted
      polkit_gnome
      gnome.eog # eye of gnome
      gnome.nautilus
      libreoffice
      calibre # ebooks
      localsend # local network file sharing
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
