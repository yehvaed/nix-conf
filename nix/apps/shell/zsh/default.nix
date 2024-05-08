{ lib, ... }:
let
  inherit (builtins) readFile;

  withConfigFile = plugin: initFile:
  {
    name = plugin.pname;
    src = plugin;
    file = initFile;
  };


in {
  nix-config.apps.zsh = {
    home = { pkgs, ... }: {
      programs.zsh = {
        plugins = with pkgs; [
          # command line
          (withConfigFile zsh-f-sy-h "share/zsh/site-functions/F-Sy-H.plugin.zsh")
          (withConfigFile zsh-vi-mode "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh")
          

          # pickers
          (withConfigFile zsh-fzf-tab "share/fzf-tab/fzf-tab.plugin.zsh")

          # misc
          (withConfigFile zsh-you-should-use "share/zsh/plugins/you-should-use/you-should-use.plugin.zsh")
          (withConfigFile zsh-defer "share/zsh-defer/zsh-defer.plugin.zsh")
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

          ${readFile ./functions.zsh}

          alias \$=""
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
      extraOptions = [ "--group-directories-first" "--header" ];
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
