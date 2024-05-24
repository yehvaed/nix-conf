{ inputs, ... }:
let inherit (builtins) readFile;
in {
  nix-config.apps.rofi = {
    home = { pkgs, ... }: {
      programs.rofi = {
        extraConfig = { modi = "drun"; };
        enable = true;
      };
    };

    tags = [ "xmonad" "rofi" ];
  };
}
