{ lib, ... }:
let
  inherit (builtins) readFile;
in {
  nix-config.apps.zsh = {
    home = { pkgs, ... }: {
      programs.zsh = {
        plugins = with pkgs; [
          # command line
          {
            name = "F-Sy-H";
            src = zsh-f-sy-h;
            file = "share/zsh/site-functions/F-Sy-H.plugin.zsh";
          }
          {
            name = "zsh-vi-mode";
            src = zsh-vi-mode;
            file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
          }

          # pickers
          {
            name = "fzf-tab";
            src = zsh-fzf-tab;
            file = "share/fzf-tab/fzf-tab.plugin.zsh";
          }

          # misc
          {
            name = "zsh-defer";
            src = zsh-defer;
            file = "share/zsh-defer/zsh-defer.plugin.zsh";
          }
        ];

        oh-my-zsh = {
          enable = true;
          theme = "af-magic";
          plugins = [ "git" "history" ];
        };

        envExtra = ''
          export EDITOR="nvim";
        '';

        initExtra = ''
          zsh-defer bindkey "^r" "fzf-history-widget"
          eval "$(${pkgs.direnv}/bin/direnv hook zsh)"
        '';

        shellAliases = {
          cat = "bat";
        };

        dotDir = ".config/zsh";

        historySubstringSearch.enable = true;
        enable = true;
      };

      
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.ripgrep = {
      enable = true;
    };

    programs.eza = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.bat = {
      enable = true;
      
    };

    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [ "--cmd cd" ];
    };

    home.packages = with pkgs; [
      direnv
    ];

    };

    tags = [ "development" ];
  };
}
