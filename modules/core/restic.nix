{...}: {
  services.restic.backups = {
    remotebackup = {
      user = "willow";
      passwordFile = "/etc/nixos/secrets/restic-password";
      paths = [
        "/home/willow/docs"
        "/home/willow/git"
      ];
      repository = "/mnt/share/restic";
      timerConfig = {
        OnCalendar = "13:00";
        Persistent = true;
      };
      pruneOpts = [
        "--keep-daily 7"
        "--keep-weekly 5"
        "--keep-monthly 12"
      ];
    };
  };
}
