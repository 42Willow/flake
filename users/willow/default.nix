{
  config,
  osConfig,
  ...
}: {
  programs.home-manager.enable = true;

  home = {
    username = "willow";
    homeDirectory = osConfig.users.users.willow.home;
    stateVersion = "24.05";
  };

  nix.settings = {
    warn-dirty = false;
    allowed-users = ["willow"];
    trusted-users = ["root" "willow"];
  };

  imports = [
    ./core
    ./pkgs
    ./scripts
    ./services
    ./themes
  ];

  nixpkgs.config.allowUnfree = true;
}
