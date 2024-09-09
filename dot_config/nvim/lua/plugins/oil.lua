return {
  'stevearc/oil.nvim',
  config = function()
    local oil = require 'oil'
    oil.setup {
      default_file_explorer = true,
      keymaps = {
        ['q'] = 'actions.close'
      },
    }

    vim.keymap.set('n', '<leader>e', oil.toggle_float, { desc = 'Oil' })
  end,
}
