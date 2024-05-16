{ ... }:
let inherit (builtins) readFile;
in {
  nix-config.apps.greetd = {
    nixos ={ pkgs, ... }: {
      services = {
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

    tags = [ "login" ];
  };
}
