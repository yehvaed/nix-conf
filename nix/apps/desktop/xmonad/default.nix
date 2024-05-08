{ ... }:
let inherit (builtins) readFile;
in {
  nix-config.apps.xmonad = {
    nixos ={ pkgs, ... }: {
      services = {
        xserver = {
          enable = true;
          
          windowManager.xmonad = {
            enable = true;
            enableContribAndExtras = true;
          };

          displayManager = {
            defaultSession = "none+xmonad";
            startx.enable = true;
          };

          desktopManager.xterm.enable = false;
        };
     
      greetd = {
        enable = true;
        vt = 7;
        settings = {
          default_session = {
            command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd startx";
          };
        };
      };
      };
    };
    tags = [ "desktop" ];
  };
}
