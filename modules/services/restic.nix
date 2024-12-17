{pkgs, ...}: {
  users = {
    users.restic = {
      isSystemUser = true;
      group = "restic";
    };
    groups.restic = {};
  };

  security.wrappers.restic = {
    source = "${pkgs.restic.out}/bin/restic";
    owner = "restic";
    group = "restic";
    permissions = "u=rwx,g=,o=";
    capabilities = "cap_dac_read_search=+ep";
  };

  services.restic.backups = {
    remotebackup = {
      passwordFile = "/home/willow/flake/secrets/restic";
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
