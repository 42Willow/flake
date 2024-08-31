{...}: {
  imports = [
    ./binds.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
  };
}
