{ ... }:
let inherit (builtins) readFile;
in {
  nix-config.apps.xmonad = {
    home = { pkgs, ... }: {
      xsession = {
        enable = true;
        windowManager.xmonad = {
          enable = true;
          enableContribAndExtras = true;
          config = pkgs.substitute { src = ./xmonad.hs; };
        };
        importedVariables = [ "DISPLAY" ];
      };
    };

    nixos = { pkgs, ... }: {
      services = {
        displayManager = { defaultSession = "none+xmonad"; };
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
