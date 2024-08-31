{...}: {
  imports = [
    ./binds.nix
    ./rules.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
  };
}
