{...}: {
  imports = [
    ./binds.nix
    ./rules.nix
    ./settings.nix
    ./env.nix
    ./autostart.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
  };
}
