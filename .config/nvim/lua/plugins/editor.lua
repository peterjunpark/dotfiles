return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local oil = require("oil")
      oil.setup({
        lsp_rename_autosave = "unmodified",
        columns = {
          "icon",
        },
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
          ["_"] = "actions.select_split",
          ["="] = "actions.open_cwd",
        },
        float = {
          border = "solid",
          max_width = 100,
          max_height = 32,
        },
        progress = {
          border = "solid",
        },
        skip_confirm_for_simple_edits = true,
      })
      vim.keymap.set("n", "<leader>e", oil.toggle_float, { silent = true, desc = "Oil (File Explorer)" })
      vim.keymap.set("n", "<leader>E", function()
        vim.cmd("vsplit | wincmd l")
        oil.open()
      end, { silent = true, desc = "Oil (Vsplit)" })
    end,
  },
  {
    "stevearc/aerial.nvim",
    opts = {
      layout = {
        min_width = 40,
        max_width = 100,
        resize_to_content = true,
        default_direction = "float",
      },
      float = {
        border = "solid",
        relative = "editor",
        max_height = 0.8,
      },
    },
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
        show_close_icon = false,
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
  {
    "SmiteshP/nvim-navic",
    opts = {
      highlight = false,
    },
  },
  -- disable
  {
    -- using oil.nvim instead
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "folke/flash.nvim",
    enabled = false,
  },
}
