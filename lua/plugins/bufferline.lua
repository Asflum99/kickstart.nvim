return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  opts = {
    options = {
      mode = 'buffers',
      separator_style = 'slant',
      show_buffer_close_icons = false,
      show_close_icon = false,
      diagnostics = 'nvim_lsp',
      always_show_bufferline = true,
      offsets = {
        {
          filetype = 'snacks_layout_box',
          text = 'File Explorer',
          text_align = 'left',
          separator = true,
        },
      },
    },
  },
}
