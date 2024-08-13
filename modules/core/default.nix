{...}: {
  imports =
    [(import ./user.nix)]
    ++ [(import ./catppuccin.nix)]
    ++ [(import ./pipewire.nix)];
}
