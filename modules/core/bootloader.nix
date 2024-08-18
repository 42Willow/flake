{...}: {
  boot.loader = {
    systemd-boot = {
      enable = true;
      editor = false;
      memtest86.enable = true;
      netbootxyz.enable = true;
    };
    efi.canTouchEfiVariables = true;
  };
}
