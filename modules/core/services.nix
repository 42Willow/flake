{...}: {
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;

    # Printing
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    # dbus.enable = true;
    # fstrim.enable = true;
    xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
