{...}: {
  security = {
    polkit.enable = true;
    rtkit.enable = true; # optional but recommended
  };
}
