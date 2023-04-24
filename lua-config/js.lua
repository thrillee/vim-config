-- npm i -g typescript typescript-language-server
-- npm i -g eslint_d
-- npm i -g vscode-langservers-extracted

local nvim_lsp = require('lspconfig')

-- JavaScript and JavaScript React/JSX
-- nvim_lsp.tsserver.setup({})
nvim_lsp.efm.setup({
  cmd = { "eslint_d", "--stdin", "--stdin-filename", "%filepath", "--format", "json" },
  init_options = { documentFormatting = true },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_dir = nvim_lsp.util.root_pattern("package.json", ".git"),
  settings = {
    languages = {
      javascript = { { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true } },
      javascriptreact = { { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true } },
      typescript = { { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true } },
      typescriptreact = { { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true } },
    },
  },
  on_attach = function(client, bufnr)
    require("lsp_signature").on_attach({
      bind = true,
      handler_opts = {
        border = "single"
      }
    })
  end,
})

-- Customize diagnostics display (see :help lsp-handler-configuration)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      prefix = "",
      spacing = 2,
    },
    signs = true,
    update_in_insert = false,
  }
)

