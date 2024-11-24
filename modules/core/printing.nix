{pkgs, lib, ...}: {
  services.printing = {
    enable = true;
    # allowFrom = [ "all" ];
    # browsing = true;
    # defaultShared = true;
    openFirewall = true;
    drivers = [ pkgs.gutenprint ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  hardware.printers = {
    ensurePrinters = [
      {
        # http://localhost:631/printers/Brother-HL-5340D
        name = "Brother-HL-5340D";
        location = "Home";
        description = "Brother HL-5340D Laser";
        deviceUri = "lpd://192.168.1.40/binary_p1";
        # model = "gutenprint.5.3://brother-hl-5340d/expert";
        model = "gutenprint.${lib.versions.majorMinor (lib.getVersion pkgs.gutenprint)}://brother-hl-5340d/expert";
        ppdOptions = {
          PageSize = "A4";
          # pdftops-renderer = "gs";
        };
      }
    ];
    ensureDefaultPrinter = "Brother-HL-5340D";
  };
}
