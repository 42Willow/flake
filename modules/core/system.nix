{
  pkgs,
  config,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];

  time.timeZone = "Australia/Sydney";

  i18n.defaultLocale = "en_AU.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  nixpkgs.config.allowUnfree = true;

  environment = {
    systemPackages = with pkgs; [
      vim
      wget
      curl
      git
    ];
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true; # optional but recommended
  };

  console.useXkbConfig = true; # Use XKB configuration for TTYs

  system.stateVersion = "24.05";
}
