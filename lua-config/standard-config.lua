-- Set mapleader to " "
vim.g.mapleader = " "

-- Panel switching
vim.api.nvim_set_keymap('n', '<leader>h', ':wincmd h<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':wincmd j<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', ':wincmd k<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':wincmd l<CR>', { noremap = true })

-- Split panel
vim.api.nvim_set_keymap('n', '<leader>v', '<C-w>v', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>s', '<C-w>s', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Left>', ':tabprevious<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':tabprevious<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':tabnext<CR>', { noremap = true })

-- Resize
vim.api.nvim_set_keymap('n', '<leader>hh', ':vertical resize -3<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ll', ':vertical resize +3<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>kk', ':resize -3<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>jj', ':resize +3<CR>', { noremap = true })

-- Open terminal
vim.cmd('set shell=/bin/zsh')
vim.api.nvim_set_keymap('n', '<leader>tt', ':vnew term://bash<CR>', { noremap = true })

-- Change split for vertical to horizontal or vice versa
vim.api.nvim_set_keymap('n', '<leader>tv', '<C-w>t<C-w>H', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tj', '<C-w>t<C-w>K', { noremap = true })

-- Map jk to escape in insert mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })

-- Map yanked to clipboard
vim.api.nvim_set_keymap('v', '<C-c>', '"*y', { noremap = true })

-- vim.api.nvim_set_keymap('n', '<leader>p', "\"_dP", { noremap = true })
vim.keymap.set('x', '<leader>p', "\"_dP")

-- Map show undo tree
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeShow<CR>', { noremap = true })

--  Move chunck of code up and down
vim.keymap.set('v', "J", ":<C-u>'<,'>m '>+1<CR>gv=gv")
vim.keymap.set('v', "K", ":<C-u>'<,'>m '<-2<CR>gv=gv")

--  Keep cursor in the middle
vim.keymap.set('n', "<C-d>", "<C-d>zz")
vim.keymap.set('n', "<C-u>", "<C-u>zz")

vim.keymap.set('n', "n", "nzzzv")
vim.keymap.set('n', "N", "Nzzzv")

-- Editor config
if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end
vim.opt.background = "dark"

-- THEMES
-- Set colorscheme to abscs
vim.cmd('colorscheme abscs')

-- Alternatively, to set colorscheme to gruvbox:
-- vim.cmd('colorscheme gruvbox')

-- Alternatively, to set colorscheme to github_:
-- vim.cmd('colorscheme github_')

-- Alternatively, to set colorscheme to ayu:
-- vim.g.ayucolor = "dark"
-- vim.cmd('colorscheme ayu')

-- Alternatively, to set colorscheme to gruvbox-material:
-- vim.g.gruvbox_material_better_performance = 1
-- vim.g.gruvbox_material_background = 'hard'
-- vim.cmd('colorscheme gruvbox-material')
