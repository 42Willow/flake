{ pkgs, config, ... }:
{
  services.mpd = {
    enable = true;
    musicDirectory = "${config.xdg.userDirs.music}";
    dataDir = "${config.xdg.configHome}/mpd";
    network.startWhenNeeded = true;
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire"
      }
    '';
  };
  programs.ncmpcpp = {
    enable = true;
    package = pkgs.ncmpcpp.override {
      visualizerSupport = true;
      clockSupport = true;
      taglibSupport = true;
    };
  };
}
