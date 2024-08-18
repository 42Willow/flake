switch:
  nh os switch

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
