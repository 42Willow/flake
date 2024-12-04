{config, ...}: {
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
        hooks: {
          pre_prompt: [{ ||
            if (which direnv | is-empty) {
              return
            }

            direnv export json | from json | default {} | load-env
            if 'ENV_CONVERSIONS' in $env and 'PATH' in $env.ENV_CONVERSIONS {
              $env.PATH = do $env.ENV_CONVERSIONS.PATH.from_string $env.PATH
            }
          }]
        }
      }
    '';
    extraEnv = ''
      $env.FLAKE = "${config.home.homeDirectory}/flake"
      $env.PATH = ($env.PATH | split row (char esep)
        | append "~/.cargo/bin")
    '';
  };
  # TODO starship
}
