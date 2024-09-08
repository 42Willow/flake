{...}: {
  services = {
    gnome.gnome-keyring.enable = true;
    dbus.enable = true; # D-Bus message bus
    fstrim.enable = true; # SSD TRIM
    gvfs.enable = true; # GNOME Virtual File System

    # Printing
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
