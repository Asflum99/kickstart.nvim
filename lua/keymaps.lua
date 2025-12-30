local map = vim.keymap.set

-- [[ Basic Keymaps ]]
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Salir de nvim
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit Nvim' })
map('n', '<leader>qw', '<cmd>wq<cr>', { desc = 'Save and Quit' })

-- Diagnostico
map('n', '<leader>xq', vim.diagnostic.setqflist, { desc = 'Open Quickfix list' })
