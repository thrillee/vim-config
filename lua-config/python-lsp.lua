require'lspconfig'.pyright.setup {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
      formatting = {
        provider = "black",
      },
      jediEnabled = false,
      linting = {
        enabled = true,
        pylintEnabled = true,
        pylintArgs = {"--load-plugins", "pylint_django"},
        flake8Enabled = true,
        flake8Args = {"--exclude", "*migrations*"},
      },
    },
  },
  single_file_support = true,
  on_attach = function(client, bufnr)
    -- Add any custom on_attach behavior here
  end,
}

vim.cmd("autocmd FileType python set sw=4")
vim.cmd("autocmd FileType python set ts=4")
vim.cmd("autocmd FileType python set sts=4")

vim.api.nvim_buf_set_var(0, "surround_{char2nr('v')}", "{{ \r }}")
vim.api.nvim_buf_set_var(0, "surround_{char2nr('{')}", "{{ \r }}")
vim.api.nvim_buf_set_var(0, "surround_{char2nr('%')}", "{% \r %}")
vim.api.nvim_buf_set_var(0, "surround_{char2nr('b')}", "{% block \1block name: \1 %}\r{% endblock \1\1 %}")
vim.api.nvim_buf_set_var(0, "surround_{char2nr('i')}", "{% if \1condition: \1 %}\r{% endif %}")
vim.api.nvim_buf_set_var(0, "surround_{char2nr('w')}", "{% with \1with: \1 %}\r{% endwith %}")
vim.api.nvim_buf_set_var(0, "surround_{char2nr('f')}", "{% for \1for loop: \1 %}\r{% endfor %}")
vim.api.nvim_buf_set_var(0, "surround_{char2nr('c')}", "{% comment %}\r{% endcomment %}")

