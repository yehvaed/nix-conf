local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp = require('lspconfig')

local defaultConfig = {
    capabilities = lsp_capabilities
}

local servers = {
  gopls = {},
  tsserver = {},
}

for k, v in pairs(servers) do
  local config = vim.tbl_deep_extend('force', defaultConfig, v)
  lsp[k].setup(config)  
end

