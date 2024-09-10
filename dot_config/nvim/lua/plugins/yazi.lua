return {
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>e',
        '<cmd>Yazi<CR>',
        desc = 'Yazi',
      },
      {
        -- Open in the current working directory
        '<leader>E',
        '<cmd>Yazi cwd<CR>',
        desc = 'Yazi (current working directory)',
      },
      {
        -- NOTE: this requires a version of yazi that includes
        -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
        '<leader>y',
        '<cmd>Yazi toggle<cr>',
        desc = 'Yazi (resume last session)',
      },
    },
    opts = {
      open_for_directories = true,
      keymaps = {
        show_help = '<f1>',
      },
    },
  },
  -- 'stevearc/oil.nvim',
  -- config = function()
  --   local oil = require 'oil'
  --   oil.setup {
  --     default_file_explorer = true,
  --     columns = {
  --       "icon",
  --       "permissions",
  --       "size",
  --       "mtime"
  --     }
  --   }
  --
  --   vim.keymap.set('n', '<leader>e', oil.toggle_float, { desc = 'Explorer' })
  --   vim.keymap.set('n', '<leader>we', function()
  --     vim.cmd 'vsplit | wincmd l'
  --     oil.open()
  --   end, { desc = 'Explorer in vsplit' })
  -- end,
}
