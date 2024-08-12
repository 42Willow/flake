{
  inputs,
  nixpkgs,
  self,
  username,
  host,
  ...
}: {
  imports = [(import ./user.nix)]
  ++ [(import ./pipewire.nix)];
}
