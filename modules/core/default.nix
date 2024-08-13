{
  inputs,
  nixpkgs,
  self,
  username,
  host,
  ...
}: {
  imports =
    [(import ./user.nix)]
    ++ [(import ./catppuccin.nix)]
    ++ [(import ./pipewire.nix)];
}
