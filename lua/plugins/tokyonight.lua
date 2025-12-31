return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    style = 'night',
    styles = {
      comments = { italic = false },
      variables = { italic = false },
    },
    on_highlights = function(hl, c)
      --- @--- Configuración de BufferLine ---
      hl.BufferLineFill = { bg = c.bg_dark }
      -- Pestaña seleccionada (Azul)
      hl.BufferLineBufferSelected = { fg = c.blue, bg = c.bg_highlight, bold = true }
      -- Forzar Naranja cuando está modificado (usando la paleta 'c')
      hl.BufferLineModified = { fg = c.orange, bg = c.bg_dark }
      hl.BufferLineModifiedVisible = { fg = c.orange, bg = c.bg_dark }
      hl.BufferLineModifiedSelected = { fg = c.orange, bg = c.bg_highlight, bold = true }
      -- Indicador invisible
      hl.BufferLineIndicatorSelected = { fg = c.bg_highlight, bg = c.bg_highlight }

      local universal_links = {
        ['@lsp.type.selfParameter'] = '@variable.builtin',
      }

      for lsp_label, theme_group in pairs(universal_links) do
        hl[lsp_label] = { link = theme_group }
      end
    end,
  },
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd.colorscheme 'tokyonight-night'
  end,
}
