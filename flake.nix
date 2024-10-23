{
  description = "NixOS configuration of 42Willow";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    # theme management
    catppuccin.url = "github:42willow/catppuccin-nix";
    # catppuccin.url = "path:/home/willow/git/sw/catppuccin-nix";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin-catwalk.url = "github:catppuccin/catwalk";
    catppuccin-whiskers.url = "github:catppuccin/whiskers";

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # spicetify
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # neovim
    # nixvim = {
    #   url = "github:nix-community/nixvim/";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

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
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      earthy = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/earthy
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          host = "earthy";
          inherit self inputs username;
        };
      };
      anemone = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [
          ./hosts/anemone
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          host = "anemone";
          inherit self inputs username;
        };
      };
      lily = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/lily
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          host = "lily";
          inherit self inputs username;
        };
      };
    };
  };
}
