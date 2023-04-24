-- Nerd Commenter
-- Use compact syntax for prettified multi-line comments
vim.g.NERDCompactSexyComs = 1
-- Allow commenting and inverting empty lines (useful when commenting a region)
vim.g.NERDCommentEmptyLines = 1
-- Enable trimming of trailing whitespace when uncommenting
vim.g.NERDTrimTrailingWhitespace = 1
-- Enable NERDCommenterToggle to check all selected lines is commented or not
vim.g.NERDToggleCheckAllLines = 1
-- Add spaces after comment delimiters by default
vim.g.NERDSpaceDelims = 1
-- Map ++ to call NERD Commenter and use iTerm key bindings
-- to bind Ctmd+/ to ++
vim.api.nvim_set_keymap('v', '++', '<plug>NERDCommenterToggle', {})
vim.api.nvim_set_keymap('n', '++', '<plug>NERDCommenterToggle', {})
