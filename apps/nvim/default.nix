{ pkgs, ... }:
let 
inherit (builtins) readFile;

withConfig = plugin: type: configFile:
{
  inherit plugin;
  inherit type;
  config = readFile(configFile);
};

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

          (withConfig nvim-cmp "lua" ./plugins/editor/nvim-cmp.lua)
          (withConfig nvim-lspconfig "lua" ./plugins/editor/nvim-lspconfig.lua)

          # pickers
          (withConfig fzf-lua "lua" ./plugins/pickers/fzf-lua.lua)

          # themes
          (withConfig neovim-ayu "lua" ./plugins/themes/ayu.lua)
  
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
