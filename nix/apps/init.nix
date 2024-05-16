{
  nix-config.apps.init = {
    enable = true;
    home = {
      home.stateVersion = "23.05";
      programs.home-manager.enable = true;
    };
  };

  nix-config.defaultTags = {
    # desktop && guis 
    xmonad = false;
    login = false;
    terminal = false;

    # shared
    tools = true;
  };

  nix-config.homeApps = [ ];
}
