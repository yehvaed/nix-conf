{ ... }:
let inherit (builtins) readFile;
in {
  nix-config.apps.greetd = {
    nixos = { pkgs, ... }: {
      services = {
        greetd = {
          enable = true;
          vt = 7;
          settings = {
            default_session = {
              command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd ${
                  pkgs.writeShellScriptBin "startx" ''
                    systemctl --user start tray.target
                    startx --:6
                  ''
                }/bin/startx";
            };
          };
        };
      };
    };

    tags = [ "login" ];
  };
}
