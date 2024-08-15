{ pkgs, ... }:
{
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts =
        let
          fnts = [
            "MonaspiceNe Nerd Font"
          ];
        in
        {
          monospace = fnts;
          sansSerif = fnts;
          serif = fnts;
          emoji = [
            "Twitter Color Emoji"
            "Noto Color Emoji"
          ];
        };
    };
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "Monaspace" ]; })
      corefonts
      noto-fonts

      # fonts for none latin languages
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif

      # emoji
      twemoji-color-font
      noto-fonts-color-emoji
    ];
  };
}
