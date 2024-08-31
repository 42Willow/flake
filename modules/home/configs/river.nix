{...}: let
  super = "Super";
in {
  wayland.windowManager.river = {
    enable = true;
    settings = {
      spawn = [
        "firefox"
        "kitty"
      ];

      map = {
        normal = {
          "${super} Return" = "spawn kitty";
          "${super} Q" = "close";
          "${super} M" = "exit";
          "${super} D" = "spawn anyrun";
          "${super} J" = "focus-view next";
          "${super} K" = "focus-view previous";
          "${super}+Shift J" = "swap next";
          "${super}+Shift K" = "swap previous";
        };
      };

      map-pointer = {
        normal = {
          "${super} BTN_LEFT" = "move-view";
          "${super} BTN_RIGHT" = "resize-view";
          "${super} BTN_MIDDLE" = "toggle-float";
        };
      };
    };
  };
}
