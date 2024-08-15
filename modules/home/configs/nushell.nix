{...}: {
  programs.nushell = {
    enable = true;
    extraConfig = ''
      $env.config = {
        show_banner: false,
        rm: {
          always_trash: true
        }
        ls: {
          clickable_links: true
        }
        completions: {
          case_sensitive: false
          quick: true
          partial: true
          algorithm: "fuzzy"
        }
      }
    '';
  };
}
