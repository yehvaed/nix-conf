{ inputs, ... }:
let inherit (builtins) readFile;
in {
  nix-config.apps.qutebrowser = {
    home = { pkgs, ... }: {
      programs.qutebrowser = {
        searchEngines = {
          DEFAULT = "https://www.google.com/search?hl=en&q={}";
        };

        enable = true;
      };
    };

    tags = [ "browser" ];
  };
}
