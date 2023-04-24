require('lspconfig').html.setup{
         on_attach = function(client, bufnr)
            -- Enable formatting on save
            local function buf_format()
               client.request('textDocument/formatting', nil, {
                  textDocument = vim.lsp.util.make_text_document_params()
               }, function(_, _, _, _) end)
            end
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', ':lua buf_format()<CR>', { noremap = true, silent = true })
         end,
      }
