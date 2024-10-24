{pkgs, ...}: {
  users.users.restic = {
    isNormalUser = true;
  };

  security.wrappers.restic = {
    source = "${pkgs.restic.out}/bin/restic";
    owner = "restic";
    group = "users";
    permissions = "u=rwx,g=,o=";
    capabilities = "cap_dac_read_search=+ep";
  };

  services.restic.backups = {
    remotebackup = {
      passwordFile = "/etc/nixos/secrets/restic-password";
      paths = [
        "/home/willow/docs"
        "/home/willow/git"
        "/home/willow/media"
      ];
      repository = "/mnt/share/restic";
      timerConfig = {
        OnCalendar = "daily";
        Persistent = true;
      };
      pruneOpts = [
        "--keep-daily 7"
        "--keep-weekly 5"
        "--keep-monthly 12"
      ];
      extraBackupArgs = [
        "--exclude=\"node_modules/*\""
      ];
    };
  };
}
