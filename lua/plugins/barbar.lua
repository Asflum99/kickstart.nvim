return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- opcional: para estado de git
    'nvim-tree/nvim-web-devicons', -- iconos de archivos
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    animation = false,
    insert_at_start = true,
    icons = {
      buffer_index = false,
      filetype = { enabled = true },
      -- Aquí está el truco: vaciamos el icono para usar solo el color
      modified = { button = '' },
      button = '×',
      separator = { left = '▎', right = '' },
      inactive = { separator = { left = '▎', right = '' } },
    },
  },
  config = function(_, opts)
    require('barbar').setup(opts)

    -- CONFIGURACIÓN DE COLORES (Aquí obligamos al naranja)
    local colors = {
      bg_dark = '#1a1b26',
      bg_active = '#292e42',
      orange = '#e0af68',
      blue = '#7aa2f7',
      grey = '#545c7e',
    }

    -- Aplicamos los colores directamente
    local set_hl = vim.api.nvim_set_hl

    -- Fondo de la barra
    set_hl(0, 'BufferTabpageFill', { bg = colors.bg_dark })

    -- Pestaña Inactiva
    set_hl(0, 'BufferInactive', { fg = colors.grey, bg = colors.bg_dark })

    -- Pestaña Activa (Normal -> Azul)
    set_hl(0, 'BufferCurrent', { fg = colors.blue, bg = colors.bg_active, bold = true })

    -- PESTAÑA MODIFICADA (Aquí es donde Barbar brilla)
    -- Inactiva modificada
    set_hl(0, 'BufferInactiveMod', { fg = colors.orange, bg = colors.bg_dark })
    -- ACTIVA MODIFICADA (Forzamos naranja sobre el fondo de pestaña activa)
    set_hl(0, 'BufferCurrentMod', { fg = colors.orange, bg = colors.bg_active, bold = true })
  end,
}
