{ ... }:
{
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    printing.enable = true;
    # dbus.enable = true;
    # fstrim.enable = true;
    xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
