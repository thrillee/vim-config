local lspconfig = require('lspconfig')

lspconfig.yamlls.setup {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml" },
  on_attach = function(client)
    -- Additional LSP configurations
    -- Example: Enable completion triggered by <C-x><C-o>
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end
}

