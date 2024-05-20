{ inputs, ... }:
let inherit (builtins) readFile;
in {
  nix-config.apps.qutebrowser = {
    home = { pkgs, ...}: {
      programs.qutebrowser = {
        enable = true;
      };
    };

    tags = [ "browser" ];
  };
}
