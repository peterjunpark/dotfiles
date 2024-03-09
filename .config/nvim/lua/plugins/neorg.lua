return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Neorg",
    ft = "norg",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- load default behaviour
          ["core.concealer"] = {}, -- add pretty icons
          ["core.dirman"] = { -- manage neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes",
            },
          },
          ["core.keybinds"] = {
            config = {
              -- default_keybinds = false,
              neorg_leader = "<leader>n",
            },
            -- hook = function(keybinds)
            -- end,
          },
        },
      })
    end,
    keys = {
      { "<leader>nc", "<cmd>Neorg<cr>", desc = "Commands" },
      { "<leader>ne", "<cmd>Neorg index<cr>", desc = "Index" },
      { "<leader>nq", "<cmd>Neorg return<cr>", desc = "Return", ft = "norg" },
      { "<leader>nj", "<cmd>Neorg journal<cr>", desc = "Journal" },
      { "<leader>nw", "<cmd>Neorg workspace<cr>", desc = "Workspace" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>n"] = { name = "+notes" },
      },
    },
  },
}
