{...}: {
  wayland.windowManager.hyprland.settings = {
    # ~ Keybinds ~
    #   See https://wiki.hyprland.org/Configuring/Binds/

    # l -> locked, will also work when an input inhibitor (e.g. a lockscreen) is active.
    # r -> release, will trigger on release of a key.
    # e -> repeat, will repeat when held.
    # n -> non-consuming, key/mouse events will be passed to the active window in addition to triggering the dispatcher.
    # m -> mouse, see below.
    # t -> transparent, cannot be shadowed by other binds.
    # i -> ignore mods, will ignore modifiers.
    # s -> separate, will arbitrarily combine keys between each mod/key, see [Keysym combos](#keysym-combos) above.
    # d -> has description, will allow you to write a description for your bind.
    # p -> bypasses the app's requests to inhibit keybinds.

    "$mod" = "SUPER";
    "$altMod" = "ALT";
    "$sudoMod" = "SUPER SHIFT";

    # Mouse bindings
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    # Repeating bindings
    bindle = [
      ", xf86audioraisevolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", xf86audiolowervolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", xf86audiomute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", xf86monbrightnessup, exec, brightnessctl set +5%"
      ", xf86monbrightnessdown, exec, brightnessctl set 5%-"
    ];

    # Always-on bindings
    bindl = [
      ", xf86display, exec, hyprctl dispatch dpms off"
      ", xf86wlan, exec, nmcli radio wifi toggle"
      # ", xf86tools, exec, /home/willow/.dotfiles/tofi/power_menu.sh" # TODO
      ", xf86bluetooth, exec, bluetoothctl power toggle"
      # ", xf86keyboard, exec, hyprctl keyword input:kb_variant colemak" # TODO: choose another bind
      ", xf86favorites, exec, hyprctl dispatch pin"
      ", xf86audioplay, exec, playerctl play-pause"
      ", xf86audiopause, exec, playerctl play-pause"
      ", xf86audionext, exec, playerctl next"
      ", xf86audioprev, exec, playerctl previous"
      ", xf86audiomicmute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ", xf86calculator, exec, speedcrunch"
    ];

    # Normal bindings
    bind =
      [
        # ~ Executables ~
        # TODO
        # "$mod, Print, exec, ~/.config/hypr/scripts/screen.sh"
        # "$altMod, Print, exec, ~/.config/hypr/scripts/screen.sh audio"
        # "$altMod, C, exec, ~/.config/hypr/scripts/hyprpicker.sh"
        # "mod, V, exec, ~/.config/hypr/scripts/clipboard.sh"
        # "altMod, V, exec, cliphist wipe && dunstify \"󱘘 Clipboard history cleared\""
        # "mod, code:60, exec, rofimoji"

        ", Print, exec, grim -g \"$(slurp -d -c f5bde6)\" - | wl-copy"
        "$mod, space, exec, tofi-drun --drun-launch=true --fuzzy-match=true --font /usr/share/fonts/OTF/MonaspiceNeNerdFont-Regular.otf"
        "$mod, Q, exec, kitty"
        "$mod, F, exec, firefox"
        "$mod, E, exec, nautilus"
        "$mod, L, exec, hyprlock"
        "$mod, B, exec, hyprctl dispatch dpms off"
        "$mod, P, exec, hyprctl dispatch pin"


        # ~ Windows ~

        "$mod, C, killactive"
        "$mod, S, togglefloating"
        "$mod, Z, alterzorder, bottom"
        "$mod, F11, fullscreenstate, -1 2" # fake fullscreen

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$altMod, left, movewindow, l"
        "$altMod, right, movewindow, r"
        "$altMod, up, movewindow, u"
        "$altMod, down, movewindow, d"


        # ~ Workspaces ~

        "$mod, mouse_up, workspace, e-1"
        "$mod, mouse_down, workspace, e+1"
        "$mod, code:49, togglespecialworkspace, scratchpad" # code:49 = `
        "$altMod, code:49, movetoworkspace, special:scratchpad" # code:49 = `
        "$mod, A, togglespecialworkspace, spotify"
        "$altMod, A, movetoworkspace, special:spotify"
        "$mod, escape, togglespecialworkspace, btop"


        # ~ Sudo mods ~

        # "$sudoMod, R, exec, ~/.config/hypr/scripts/reload.sh" TODO
        # "$sudoMod, P, exec, ~/.config/tofi/scripts/power_menu.sh" # TODO
        "$sudoMod, M, exit"
      ]
      ++ (
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (
            x: let
              ws = builtins.toString (x + 1);
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$altMod, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          9)
      );
  };
}
