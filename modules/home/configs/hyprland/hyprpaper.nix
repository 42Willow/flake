{inputs, ...}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "${inputs.wallpapers}/Catppuccin/Macchiato/Kurzgesagt-Black_Hole_1.png"
        "${inputs.wallpapers}/Catppuccin/Macchiato/Kurzgesagt-Black_Hole_2.png"
      ];
      wallpaper = [
        "eDP-1, ${inputs.wallpapers}/Catppuccin/Macchiato/Kurzgesagt-Black_Hole_1.png"
        "DP-1, ${inputs.wallpapers}/Catppuccin/Macchiato/Kurzgesagt-Black_Hole_2.png"
      ];
      splash = false;
    };
  };
}
