{...}: {
  programs.git = {
    enable = true;

    userName = "Willow";
    userEmail = "42willow@pm.me";

    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "store";
    };

    aliases = {
      co = "checkout";
      br = "branch";
      ci = "commit";
      st = "status";
      aa = "add";
      aliases = "config --get-regexp '^alias\\.'";
    };
  };
}
