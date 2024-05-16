{ inputs, ... }:
let inherit (builtins) readFile;
in {
  nix-config.apps.alacritty = {
    home = { pkgs, ...}: {
      programs.alacritty = {
          enable = true;
          settings = {
            font = {
              normal = {
                family = "FiraCode Nerd Font Propo";
                style = "Retina";
              };
              size = 6;
            };

            window = {
              padding = {
                x = 4;
                y = 4;
              };
              dynamic_padding = true;
            };
          };
          settings.import = [ pkgs.alacritty-theme.ayu_dark ];
      };
    };

    nixpkgs = {
      params.overlays = [ inputs.alacritty-theme.overlays.default ];
    };

    tags = [ "terminal" ];
  };
}
