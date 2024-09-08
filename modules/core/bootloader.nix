{config, lib, ...}: {
  options.bootloader.enable = lib.mkEnableOption "Enable the bootloader configuration.";

  config = lib.mkIf config.bootloader.enable {
    boot.loader = {
      grub = {
        enable = false;
      };
      systemd-boot = {
        enable = true;
        editor = false;
        memtest86.enable = true;
        netbootxyz.enable = true;
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
