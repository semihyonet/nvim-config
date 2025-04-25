-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'lewis6991/hover.nvim',
    config = function()
      require('hover').setup {
        init = function()
          require 'hover.providers.lsp'
          -- You can enable more providers if needed
          -- require("hover.providers.man")
          -- require("hover.providers.gh")
        end,
        preview_opts = {
          border = 'single',
        },
        preview_window = false,
        title = true,
        mouse_providers = {
          'LSP',
        },
        mouse_delay = 1000,
      }

      -- Key mappings
      vim.keymap.set('n', 'K', require('hover').hover, { desc = 'hover.nvim' })
      vim.keymap.set('n', 'gK', require('hover').hover_select, { desc = 'hover.nvim (select)' })
      vim.keymap.set('n', '<C-p>', function()
        require('hover').hover_switch 'previous'
      end, { desc = 'hover.nvim (previous source)' })
      vim.keymap.set('n', '<C-n>', function()
        require('hover').hover_switch 'next'
      end, { desc = 'hover.nvim (next source)' })

      -- Optional: mouse support
      vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, { desc = 'hover.nvim (mouse)' })
      vim.o.mousemoveevent = true
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
}
