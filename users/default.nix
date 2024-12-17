{
  inputs,
  pkgs,
  ...
}: {
  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      extraSpecialArgs = {
        inherit inputs;
      };

      users.willow = import ./willow;
    };

    users.users.willow = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel" "dialout"];
      home = "/home/willow";
      shell = pkgs.zsh;
    };
  };
}
