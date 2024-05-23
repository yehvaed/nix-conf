{ ... }:
let inherit (builtins) readFile;
in {
  nix-config.apps.xmonad = {
    home = { pkgs, ...}: {
      xsession.enable = true;
      xsession.windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
        config = ./xmonad.hs;
      };
      xsession.importedVariables = [ "DISPLAY" ];
    };

    nixos ={ pkgs, ... }: {
       services = {
        displayManager = {
          defaultSession = "none+xmonad";
        };
        xserver = {
          enable = true;
          windowManager.xmonad = {
            enable = true;
            enableContribAndExtras = true;
          };
          displayManager.startx.enable = true;
          desktopManager.xterm.enable = false;
        };
      };
    };
    tags = [ "xmonad" ];
  };
}
