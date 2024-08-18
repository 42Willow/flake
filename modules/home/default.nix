{...}: {
  imports = [
    ./configs # per application configuration
    ./dotfiles # un-nixified dotfiles
    # ./system # important system environment config
    # ./packages # programs that are used, e.g. GUI apps
    # ./services # system services, organized by display protocol
    # ./themes # Application themeing
  ];
}
