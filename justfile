switch:
  sudo nixos-rebuild switch --flake /etc/nixos#earthy

clean:
  sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old
  nix-collect-garbage -d
  nix store optimise

update:
  sudo nixos-rebuild switch --upgrade --flake /etc/nixos#earthy

boot:
  sudo nixos-rebuild boot --flake /etc/nixos#earthy