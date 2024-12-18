# Adapted from https://github.com/isabelroses/dotfiles/blob/main/home/comfy/packages/cli/starship.nix under EUPL-1.2 license

{
  lib,
  config,
  ...
}: let
  inherit (lib.strings) concatStrings;

  ss = symbol: style: {
    inherit symbol;
    format = "[$symbol ](${style})";
  };
  ssv = symbol: style: {
    inherit symbol;
    format = "via [$symbol](${style})";
  };
in {
  programs.starship = {
    enable = true;
    enableBashIntegration = config.programs.bash.enable;
    enableFishIntegration = config.programs.fish.enable;
    enableZshIntegration = config.programs.zsh.enable;
    enableNushellIntegration = config.programs.nushell.enable;

    settings = {
      add_newline = true;
      format = concatStrings [
        "[╭╴](purple)$os"
        "$all[╰─󰁔](purple)$character"
      ];

      character = {
        success_symbol = "";
        error_symbol = "";
      };

      username = {
        style_user = "white";
        style_root = "black";
        format = "[$user]($style) ";
        show_always = true;
      };

      directory = {
        truncation_length = 3;
        truncation_symbol = "…/";
        home_symbol = "󰋞 ";
        read_only_style = "197";
        read_only = "  ";
        format = "at [$path]($style)[$read_only]($read_only_style) ";

        substitutions = {
          "󰋞 /docs" = "󰈙 ";
          "󰋞 /downloads" = " ";
          "󰋞 /tmp" = " ";
          "󰋞 /media/music" = " ";
          "󰋞 /media/pictures" = " ";
          "󰋞 /media/videos" = " ";
          "󰋞 /dev" = "󱌢 ";
          "󰋞 /skl" = "󰑴 ";
          "󰋞 /.config" = " ";
        };
      };

      os = {
        style = "bold white";
        format = "[$symbol]($style)";

        symbols = {
          Arch = "";
          Artix = "";
          Debian = "";
          # Kali = "󰠥";
          EndeavourOS = "";
          Fedora = "";
          NixOS = "";
          openSUSE = "";
          SUSE = "";
          Ubuntu = "";
          Raspbian = "";
          #elementary = "";
          #Coreos = "";
          Gentoo = "";
          #mageia = ""
          CentOS = "";
          #sabayon = "";
          #slackware = "";
          Mint = "";
          Alpine = "";
          #aosc = "";
          #devuan = "";
          Manjaro = "";
          #rhel = "";
          Macos = "󰀵";
          Linux = "";
          Windows = "";
        };
      };

      container = ss " 󰏖" "yellow dimmed";
      python = ss "" "yellow";
      nodejs = ss " " "yellow";
      lua = ss "󰢱 " "blue";
      rust = ss "" "red";
      java = ss " " "red";
      c = ss " " "blue";
      golang = ss "" "blue";
      docker_context = ss " " "blue";

      nix_shell = ssv " " "blue";

      git_branch = {
        symbol = "󰊢 ";
        format = "on [$symbol$branch]($style) ";
        truncation_length = 4;
        truncation_symbol = "…/";
        style = "bold green";
      };
      git_status = {
        format = "[\\($all_status$ahead_behind\\)]($style) ";
        style = "bold green";
        conflicted = "🏳";
        up_to_date = " ";
        untracked = " ";
        ahead = "⇡\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        behind = "⇣\${count}";
        stashed = "󰏗 ";
        modified = " ";
        staged = "[++\\($count\\)](green)";
        renamed = "󰖷 ";
        deleted = " ";
      };

      battery.disabled = true;
    };
  };
}
