return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    on_attach = function(bufnr)
      local api = require 'nvim-tree.api'

      local function map_opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set('n', 'l', api.node.open.edit, map_opts 'Open')

      vim.keymap.set('n', 'h', api.node.navigate.parent_close, map_opts 'Close Directory')

      vim.keymap.set('n', '<CR>', api.node.open.edit, map_opts 'Open')
    end,
    view = {
      float = {
        enable = true,
        quit_on_focus_loss = true,
        open_win_config = function()
          local screen_w = vim.opt.columns:get()
          local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
          local window_w = 35
          local window_h = screen_h - 4
          local center_y = 1
          local center_x = screen_w - window_w - 2

          return {
            relative = 'editor',
            border = 'rounded',
            width = window_w,
            height = window_h,
            row = center_y,
            col = center_x,
          }
        end,
      },
    },
  },
}
