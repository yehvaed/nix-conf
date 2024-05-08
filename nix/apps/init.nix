{
  nix-config.apps.init = {
    enable = true;
    home = {
      home.stateVersion = "23.05";
      programs.home-manager.enable = true;
    };
  };

  nix-config.defaultTags = {
    development = false;
    desktop = false;
  };

  nix-config.homeApps = [ ];
}
