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

-- Abrir el explorador de archivos de Snacks
map('n', '<leader>e', function()
  require('snacks').explorer()
end, { desc = 'File Explorer (Snacks)' })

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

-- Navegar entre buffers (pestañas)
map('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev Buffer' })
map('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next Buffer' })

-- Cerrar buffer actual
map('n', '<leader>bd', '<cmd>bd<cr>', { desc = '[B]uffer [D]elete' })

-- Terminal Flotante
map({ 'n', 't' }, '<leader>ft', function()
  require('snacks').terminal.toggle()
end, { desc = 'Terminal float [T]oggle' })
