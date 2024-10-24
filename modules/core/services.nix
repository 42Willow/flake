{...}: {
  services = {
    gnome.gnome-keyring.enable = true;
    dbus.enable = true; # D-Bus message bus
    fstrim.enable = true; # SSD TRIM
    gvfs.enable = true; # GNOME Virtual File System

    # TODO: Make printing actually work, originally attempted in november 2024
    # Printing
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    xserver.xkb = {
      layout = "us,us";
      variant = "colemak,";
      options = "grp:alt_space_toggle, caps:backspace, shift:both_capslock_cancel";
    };
  };
}
