local map = vim.keymap.set

-- [[ Basic Keymaps ]]
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

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

-- Guardar con Ctrl + s
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

-- Buscar archivos
map('n', '<leader>ff', function()
  require('telescope.builtin').find_files()
end, { desc = '[F]ind [F]iles' })

-- Abrir el explorador en el directorio del archivo actual
-- En lua/keymaps.lua
map('n', '<leader>e', function()
  local root = require('snacks').git.get_root() or vim.fn.getcwd()

  require('nvim-tree.api').tree.toggle { path = root, find_file = true }
end, { desc = 'Explorer (Floating Root)' })

-- Lazygit: La mejor terminal para Git
map('n', '<leader>gg', function()
  require('snacks').lazygit()
end, { desc = 'Lazygit' })

-- Ver el historial de cambios del archivo actual
map('n', '<leader>gf', function()
  require('snacks').picker.git_log_file()
end, { desc = 'Git File History' })

-- Ver todos los commits del proyecto
map('n', '<leader>gl', function()
  require('snacks').picker.git_log()
end, { desc = 'Git Log' })

-- Ver los cambios actuales (diff)
map('n', '<leader>gs', function()
  require('snacks').picker.git_status()
end, { desc = 'Git Status' })

-- Navegar entre pestañas (Barbar)
map('n', '<S-h>', '<cmd>BufferPrevious<cr>', { desc = 'Prev Buffer' })
map('n', '<S-l>', '<cmd>BufferNext<cr>', { desc = 'Next Buffer' })

-- Cerrar buffer
map('n', '<leader>bd', '<cmd>BufferClose<cr>', { desc = 'Delete Buffer' })

-- Terminal Flotante
map({ 'n', 't' }, '<leader>ft', function()
  require('snacks').terminal.toggle()
end, { desc = 'Terminal float [T]oggle' })
