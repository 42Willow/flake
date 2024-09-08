switch:
  nh os switch
  # sudo nixos-rebuild switch --flake /etc/nixos#earthy

clean:
  nh clean all

update:
  nh os switch -u

boot:
  nh os boot

[group('lint')]
alejandra:
  alejandra .

[group('lint')]
statix:
  statix check .

[group('lint')]
deadnix:
  deadnix -eq .

[group('lint')]
deadnix-scan:
  deadnix .
