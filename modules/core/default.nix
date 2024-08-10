{
  inputs,
  nixpkgs,
  self,
  username,
  host,
  ...
}: {
  imports = [(import ./user.nix)];
  # ++ [ (import ./user.nix) ]
}
