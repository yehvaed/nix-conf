{ pkgs, ... }:
let 
inherit (builtins) readFile;
in {
  nix-config.apps.nvim = {
    home = { pkgs, ... }: {
      programs.neovim = {
        plugins = with pkgs.vimPlugins; [
          # editors     
          luasnip
          lspkind-nvim
          cmp-nvim-lsp
          nvim-cmp
          cmp_luasnip
          nvim-treesitter.withAllGrammars

          {
            plugin = nvim-cmp;
            type = "lua";
            config = readFile(./plugins/editor/nvim-cmp.lua);
          }
          {
            plugin = nvim-lspconfig;
            type = "lua";
            config = readFile(./plugins/editor/nvim-lspconfig.lua);
          }

          # pickers
          {
            plugin = fzf-lua;
            type = "lua";
            config = readFile (./plugins/pickers/fzf-lua.lua);
          }

          # themes
          {
            plugin = neovim-ayu;
            type = "lua";
            config = readFile (./plugins/themes/ayu.lua);
          }
  
          # icons
          nvim-web-devicons
        ];

        extraPackages = with pkgs; [
          gopls
        ];

        extraConfig = readFile (./plugins/init.vim);

        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        enable = true;
      };


      programs.fzf = {
        enable = true;
      };

      programs.ripgrep = {
        enable = true;
      };

      programs.zsh.shellAliases = { v = "nvim"; };
    };

    tags = [ "development" ];
  };
}
