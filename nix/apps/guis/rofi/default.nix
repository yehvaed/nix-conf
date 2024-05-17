{ inputs, ... }:
let inherit (builtins) readFile;
in {
  nix-config.apps.alacritty = {
    home = { pkgs, ...}: {
      programs.rofi = {
          enable = true;
      };
    };

    tags = [ "xmonad" ];
  };
}
