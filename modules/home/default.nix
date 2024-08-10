{
  pkgs,
  config,
  lib,
  catppuccin,
  inputs,
  username,
  host,
  ...
}: {
  imports =
    [(import ./dotfiles)]
    ++ [(import ./spicetify.nix)]
    ++ [(import ./packages.nix)];

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

  programs.bat = {enable = true;};

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

  programs.btop = {enable = true;};

  programs.bun = {enable = true;};

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
    regenerateTofiCache = lib.hm.dag.entryAfter ["writeBoundary"] ''
      tofi_cache=${config.xdg.cacheHome}/tofi-drun
      [[ -f "$tofi_cache" ]] && rm "$tofi_cache"
    '';
  };
  home.sessionVariables = {
    # EDITOR = "emacs";
  };
}
