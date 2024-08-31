{...}: {
  imports = [
    ./binds.nix
    ./rules.nix
    ./settings.nix
    ./env.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
  };
}
