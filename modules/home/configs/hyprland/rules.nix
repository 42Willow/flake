{...}: {
  wayland.windowManager.hyprland.settings = {
    # See https://wiki.hyprland.org/Configuring/Window-Rules/

    windowrulev2 = [
      "float,class:(KeePassXC)"
      "float,class:(speedcrunch)"
    ];
  };
}
