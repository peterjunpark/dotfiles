return {
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
      use_default_keymaps = false,
      keymaps = {
        ["<CR>"] = "actions.select",
        ["|"] = "actions.select_vsplit",
        ["_"] = "actions.select_split",
        ["q"] = "actions.close",
        ["="] = "actions.open_cwd",
        ["-"] = "actions.parent",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gp"] = "actions.preview",
        ["gl"] = "actions.refresh",
        ["g."] = "actions.toggle_hidden",
        ["gs"] = "actions.change_sort",
        ["g?"] = "actions.show_help",
        -- ["gx"] = "actions.open_external",
        -- ["<C-t>"] = "actions.select_tab",
        -- ["g\\"] = "actions.toggle_trash",
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
    vim.keymap.set("n", "<leader>o", function()
      vim.cmd("vsplit | wincmd l")
      oil.open()
    end, { silent = true, desc = "Oil (Vsplit)" })
  end,
}
