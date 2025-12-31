return {
  'folke/tokyonight.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('tokyonight').setup {
      styles = { comments = { italic = false } },
      on_highlights = function(hl, _)
        -- Fondo de la barra
        hl.BufferLineFill = { bg = '#1a1b26' }

        -- Pestaña seleccionada (Normal) -> Azul
        hl.BufferLineBufferSelected = { fg = '#7aa2f7', bg = '#292e42', bold = true }

        -- FORZAR NARANJA CUANDO ESTÁ MODIFICADO (Seleccionado o no)
        -- Usamos el naranja de Tokyo Night: c.orange o "#e0af68"
        hl.BufferLineModified = { fg = '#e0af68', bg = '#1a1b26' }
        hl.BufferLineModifiedVisible = { fg = '#e0af68', bg = '#1a1b26' }
        hl.BufferLineModifiedSelected = { fg = '#e0af68', bg = '#292e42', bold = true }

        -- Eliminar cualquier indicador que pueda "pisar" el color
        hl.BufferLineIndicatorSelected = { fg = '#292e42', bg = '#292e42' }
      end,
    }
    vim.cmd.colorscheme 'tokyonight-night'
  end,
}
