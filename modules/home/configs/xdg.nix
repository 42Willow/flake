{config, ...}: {
  xdg.userDirs = {
    enable = true;
    documents = "${config.home.homeDirectory}/docs";
    download = "${config.home.homeDirectory}/tmp";
    pictures = "${config.home.homeDirectory}/media/pictures";
    videos = "${config.home.homeDirectory}/media/videos";
    music = "${config.home.homeDirectory}/media/music";
  };
}
