{ pkgs, config, lib, catppuccin, ... }:

{
	catppuccin = {
		flavor = "macchiato";
		accent = "pink";
    enable = true;
	};

  programs.kitty = {
 		enable = true;
		settings = {
			confirm_os_window_close = 0;
   		background_opacity = "0.8";
   		cursor_blink_interval = 0;
   		mouse_hide_wait = 0;
   	};
	};

  programs.bat = {
    enable = true;
  };

  programs.tofi = {
    enable = true;
    settings = {
      width = "100%";
      height = "100%";
      border-width = 0;
      outline-width = 0;
      padding-top = "30%";
      padding-bottom = "30%";
      padding-left = "8%";
      padding-right = "8%";
      result-spacing = 25;
      num-results = 5;
      font = "monospace";
      clip-to-padding = true;
      hide-cursor = true;
    };
  };

  programs.btop = {
    enable = true;
  };

  programs.bun = {
    enable = true;
  };

  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      flavor = "macchiato";
      accent = "pink";
      cursor = {
        enable = true;
        flavor = "macchiato";
        accent = "dark";
      };
    };
  };

  nixpkgs.config.allowUnfree = true;

  home.activation = {
    # https://github.com/philj56/tofi/issues/115#issuecomment-1701748297
    regenerateTofiCache = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      tofi_cache=${config.xdg.cacheHome}/tofi-drun
      [[ -f "$tofi_cache" ]] && rm "$tofi_cache"
    '';
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # Hypr
    pkgs.xdg-desktop-portal-hyprland
    pkgs.hyprlock
    pkgs.hypridle
    pkgs.hyprpaper
    pkgs.hyprpicker
    pkgs.hyprcursor
    # Core
    pkgs.polkit_gnome
    pkgs.firefox
    pkgs.keepassxc
    pkgs.gnome.nautilus
    pkgs.gparted
    pkgs.blueman
    # Programming
    pkgs.kitty
    pkgs.vscode
    # Fun
    pkgs.spotify
    pkgs.prismlauncher
    pkgs.vesktop
    pkgs.aseprite
    # Work
    pkgs.obsidian
    pkgs.activitywatch
    # CLI
    pkgs.tldr
    pkgs.fastfetch
    pkgs.spicetify-cli
    pkgs.just
    # Screen
    pkgs.grim
    pkgs.slurp
    pkgs.wl-clipboard
    pkgs.ddcutil
    pkgs.brightnessctl


    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # ".config/hypr".source = dotfiles/hypr;
    # ".config/tofi".source = dotfiles/tofi;
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/willow/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
}
