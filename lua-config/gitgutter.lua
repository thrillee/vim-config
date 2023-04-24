-- Use fontawesome icons as signs
vim.g.gitgutter_sign_added = '+'
vim.g.gitgutter_sign_modified = '𝌡'
vim.g.gitgutter_sign_removed = '-'
vim.g.gitgutter_sign_removed_first_line = '^'
vim.g.gitgutter_sign_modified_removed = '<'

-- Jump between hunks
vim.api.nvim_set_keymap('n', '<Leader>gn', '<Plug>(GitGutterNextHunk)', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gp', '<Plug>(GitGutterPrevHunk)', { noremap = true })

-- Git commands with telescope
vim.api.nvim_set_keymap('n', '<leader>fgc', '<cmd>Telescope git_commits<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fgb', '<cmd>Telescope git_branches<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fgs', '<cmd>Telescope git_status<cr>', { noremap = true })

