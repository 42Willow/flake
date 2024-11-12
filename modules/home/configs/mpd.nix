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
      audio_output {
        type "fifo"
        name "Visualiser"
        path "/tmp/mpd.fifo"
        format "44100:16:2"
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
    # adapted for colemak
    bindings = [
      # navigation
      { key = "n"; command = "scroll_down"; }
      { key = "e"; command = "scroll_up"; }
      { key = "N"; command = [ "select_item" "scroll_down" ]; }
      { key = "E"; command = [ "select_item" "scroll_up" ]; }
      # move items
      { key = "k"; command = "move_sort_order_down"; }
      { key = "k"; command = "move_selected_items_down"; }
      { key = "m"; command = "move_sort_order_up"; }
      { key = "m"; command = "move_selected_items_up"; }
    ];
    settings = {
      # visualiser
      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "mpd_visualizer";
      visualizer_type = "ellipse";
      visualizer_look = "●●";

      # current item
      current_item_prefix = "$(magenta)$r"; # change accent color

      # selected items
      selected_item_prefix = "\"* \"";
      discard_colors_if_item_is_selected = "yes";

      # now playing
      now_playing_prefix = "\"$b$6  \"";
      now_playing_suffix = "\"$/b\"";
      centered_cursor = true;
      autocenter_mode = "yes";

      # layout
      user_interface = "alternative";
      startup_screen = "playlist";
      startup_slave_screen = "media_library";
      song_columns_list_format = "(10)[blue]{l} (45)[magenta]{t} (15)[white]{a} (30)[white]{b}";

      # display modes
      playlist_display_mode = "columns";
      browser_display_mode = "columns";
      search_engine_display_mode = "columns";
      playlist_editor_display_mode = "columns";

      # colours
      main_window_color = "white";

      # navigation
      lines_scrolled = 1; # default is 5

      # show album artist instead of artist by default
      media_library_primary_tag = "album_artist";
    };
  };
  services.mpd-discord-rpc = {
    enable = true;
    settings = {
      format = {
        details = "$title";
        state = "$artist";
        large_text = "$album";
        small_text = "Listening to $genre music with MPD ^-^";
      };
    };
  };
  systemd.user.services.mpdstats = {
    Unit = {
      Description = "Beets MPDStats daemon";
      Requires = [ "mpd.service" ];
      After = [ "mpd.service" ];
    };

    Install.WantedBy = [ "default.target" ];

    Service = {
      ExecStart = "${config.programs.beets.package}/bin/beet mpdstats";
      Restart = "on-failure";
    };
  };
  programs.beets = {
    enable = true;
    # package = pkgs.beetsPackages.beets-minimal;
    settings = {
      plugins = [
        "fetchart"
        "thumbnails"
        "mpdupdate"
        "mpdstats"
        "ftintitle"
      ];
      directory = "${config.xdg.userDirs.music}";
      library = "${config.home.homeDirectory}/media/music_library.db";
      import = {
        copy = true;
        write = true;
        autotag = true;
      };
      paths = {
        default = "Albums/%upper{%left{$albumartist,1}}/$albumartist/$album%aunique{}/$track. $title";
        singleton = "Singles/$artist/$title";
        comp = "Compilations/$album%aunique{}/$track. $title";
      };
      fetchart = {
        auto = true;
        sources = [
          "filesystem"
          "amazon"
          "itunes"
          "coverart"
          "albumart"
        ];
      };
    };
  };
}
