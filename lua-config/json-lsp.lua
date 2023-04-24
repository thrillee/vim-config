require('lspconfig').jsonls.setup({
  settings = {
    json = {
      schemas = require('schemastore').json.schemas({
        {
          fileMatch = { '.eslintrc', 'package.json', 'tslint.json' },
          url = 'https://json.schemastore.org/eslintrc.json',
        },
      }),
      validate = true,
    },
  },
  on_attach = function(client, bufnr)
    vim.bo[bufnr].filetype = 'json'
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', ':lua buf_format()<CR>', { noremap = true, silent = true })
  end,
})

