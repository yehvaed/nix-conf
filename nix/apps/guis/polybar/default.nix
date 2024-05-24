{ inputs, ... }:
let inherit (builtins) readFile;
in {
  nix-config.apps.polybar = {
    home = { pkgs, ... }: {
      services.polybar = {
        enable = true;
        package = pkgs.polybarFull;
        script = ''
          export DISPLAY=:0;
          polybar &
        '';
        config = pkgs.substitute { src = ./config.ini; };
      };
    };

    tags = [ "xmonad" ];
  };
}
