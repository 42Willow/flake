{ pkgs, inputs, ... }: {
  imports = [ inputs.stylix.homeManagerModules.stylix ];
  stylix = {
    enable = true;
    autoEnable = false;

    targets = {
      gtk.enable = true;
    };

    # https://tinted-theming.github.io/base16-gallery/
    base16Scheme = let theme = "catppuccin-macchiato";
    in "${pkgs.base16-schemes}/share/themes/${theme}.yaml";

    cursor = {
      package = pkgs.catppuccin-cursors.macchiatoDark;
      name = "catppuccin-macchiato-dark-cursors";
      size = 24;
    };

    image = "~/.wallpapers/Catppuccin/Macchiato/Kurzgesagt-On_A_Moon.png";
  };
}
