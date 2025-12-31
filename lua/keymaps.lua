local map = vim.keymap.set

local function open_nvim_tree_in_root()
  local api = require 'nvim-tree.api'
  local snacks = require 'snacks'

  -- 1. Buscar la raíz (.git o carpeta lua)
  local root = snacks.git.get_root()
  if not root or root == '' then
    root = vim.fs.find({ '.git', 'lua', 'init.lua' }, { upward = true, path = vim.fn.expand '%:p:h' })[1]
    if root then
      root = vim.fn.fnamemodify(root, ':h')
    end
  end

  -- 2. Si sigue sin encontrar nada, usa la carpeta del archivo
  root = root or vim.fn.expand '%:p:h'

  -- 3. CAMBIO CLAVE: Cambiamos el directorio de Neovim
  -- Esto es lo que elimina el "ruido" de las carpetas superiores
  vim.fn.chdir(root)

  -- 4. Abrir nvim-tree
  api.tree.open { path = root, find_file = true, update_root = true }
end

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
map('n', '<leader>e', open_nvim_tree_in_root, { desc = 'Explorer (Project Root)' })

-- Lazygit
map('n', '<leader>gg', function()
  local git_root = require('snacks').git.get_root()

  require('snacks').lazygit.open { cwd = git_root }
end, { desc = 'Lazygit (Root Dir)' })

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
