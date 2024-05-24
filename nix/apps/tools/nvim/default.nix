{ pkgs, lib, ... }:
let
  inherit (builtins) readFile;
  inherit (lib.strings) hasSuffix;

  withConfig = plugin: type: config: {
    inherit plugin;
    inherit type;
    inherit config;

  };

  withConfigFile = plugin: configFile:
    withConfig plugin (if hasSuffix ".lua" configFile then "lua" else "vim")
    (readFile (configFile));

in {
  nix-config.apps.nvim = {
    home = { pkgs, ... }: {
      programs.neovim = {
        plugins = with pkgs.vimPlugins; [
          # editors     
          (withConfigFile nvim-cmp ./plugins/editor/nvim-cmp.lua)
          (withConfigFile nvim-lspconfig ./plugins/editor/nvim-lspconfig.lua)
          (withConfig comment-nvim "lua" "require('Comment').setup()")
          luasnip
          lspkind-nvim
          cmp-nvim-lsp
          nvim-cmp
          cmp_luasnip
          nvim-treesitter.withAllGrammars

          # pickers
          (withConfigFile fzf-lua ./plugins/pickers/fzf-lua.lua)

          # themes
          (withConfigFile neovim-ayu ./plugins/themes/ayu.lua)

          # icons
          nvim-web-devicons
        ];

        extraPackages =
          import ./plugins/editor/nvim-lspconfig.nix { inherit pkgs; };
        extraConfig = readFile (./plugins/init.vim);

        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        enable = true;
      };

      programs.fzf = { enable = true; };

      programs.ripgrep = { enable = true; };

      programs.zsh.shellAliases = { v = "nvim"; };
    };

    tags = [ "essentials" "nvim" ];
  };
}
