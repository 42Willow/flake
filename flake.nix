{
  description = "NixOS configuration of 42Willow";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # theme management
    catppuccin.url = "github:42willow/catppuccin-nix";
    # catppuccin.url = "path:/home/willow/git/sw/catppuccin-nix";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # spicetify
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # neovim
    nixvim = {
      url = "github:nix-community/nixvim/";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };
    hyprland-plugins = {
      url = "github:hyprwm/Hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    # firefox
    firefox-cascade = {
      url = "github:42willow/cascade";
      flake = false;
    };

    # wallpapers
    wallpapers = {
      url = "github:42willow/wallpapers";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    catppuccin,
    ...
  } @ inputs: let
    username = "willow";
    system = "x86_64-linux";
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      earthy = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          (import ./hosts/earthy)
          catppuccin.nixosModules.catppuccin
          # if you use home-manager
          home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          host = "earthy";
          inherit self inputs username;
        };
      };
    };
  };
}
