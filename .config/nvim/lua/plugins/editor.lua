return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local oil = require("oil")
      oil.setup({
        lsp_rename_autosave = "unmodified",
        view_options = {
          is_hidden_file = function(name)
            if name == ".." then
              return false
            else
              return vim.startswith(name, ".")
            end
          end,
        },
        keymaps = {
          ["q"] = "actions.close",
          ["|"] = "actions.select_vsplit",
          ["_"] = "actions.select_split", -- inconsistent, but i like "-" as go to parent
          ["="] = "actions.open_cwd",
        },
        float = {
          border = "solid",
        },
      })
      vim.keymap.set("n", "<leader>e", oil.toggle_float, { silent = true, desc = "File Explorer (float)" })
      vim.keymap.set("n", "<leader>E", oil.open, { silent = true, desc = "File Explorer (full)" })
    end,
  },
  {
    -- remove x icons in tabs
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
      { "<Backspace>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous Buffer" },
    },
    opts = {
      options = {
        show_buffer_close_icons = false,
        show_close_icons = false,
      },
    },
  },
  {
    -- change indent scope line from solid to dashed
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "╎",
    },
  },
  -- disable
  {
    -- using telescope file browser instead
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "folke/flash.nvim",
    enabled = false,
  },
}
