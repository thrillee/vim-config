-- npm i -g typescript typescript-language-server
-- npm i -g eslint_d

local nvim_lsp = require('lspconfig')

-- TypeScript
nvim_lsp.tsserver.setup({
  on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Setup diagnostics display
    require("lsp_signature").on_attach({
      bind = true,
      handler_opts = {
        border = "single"
      }
    })
    vim.lsp.handlers["textDocument/publishDiagnostics"] =
      vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {
          prefix = "",
          spacing = 4,
        },
        signs = true,
        update_in_insert = false,
      })
  end,
})

