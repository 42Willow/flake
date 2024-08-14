{
  description = "NixOS configuration of 42Willow";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    ags.url = "github:Aylur/ags";
    hyprpanel.url = "github:42willow/HyprPanel";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    schizofox = {
      url = "github:schizofox/schizofox";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
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
