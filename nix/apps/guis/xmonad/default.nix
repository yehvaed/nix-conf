{ ... }:
let inherit (builtins) readFile;
in {
  nix-config.apps.xmonad = {
    home = { pkgs, ...}: {
      xsession.windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
        config = ./xmonad.hs;
      };
    };

    nixos ={ pkgs, ... }: {
       services = {
        xserver = {
          enable = true;
          displayManager = {
            defaultSession = "none+xmonad";
            startx.enable = true;
          };
          desktopManager.xterm.enable = false;
        };
      };
    };
    tags = [ "xmonad" ];
  };
}
