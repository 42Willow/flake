{ pkgs, lib, inputs, ...}: 

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in 
{
  imports = [inputs.spicetify-nix.homeManagerModules.default];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];

  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle
    ];
    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
      newReleases
    ];
    enabledSnippets = with spicePkgs.snippets; [
      pointer
      smooth-progress-bar
      remove-popular
      hide-download-button
      remove-top-spacing
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "macchiato";
  };
}