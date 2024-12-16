{
  inputs,
  username,
  pkgs,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs username;};
    users.${username} = {
      imports = [./../home inputs.catppuccin.homeManagerModules.catppuccin];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = ["networkmanager" "wheel" "dialout"];
    shell = pkgs.zsh;
  };
  nix.settings = {
    warn-dirty = false;
    allowed-users = ["${username}"];
    trusted-users = ["root" "${username}"];
  };
  programs.zsh.enable = true;
}
