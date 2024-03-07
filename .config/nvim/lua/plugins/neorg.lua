return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
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
        },
      })
    end,
    keys = {
      { "<leader>nn", "<cmd>Neorg<cr>", desc = "Neorg" },
      { "<leader>ni", "<cmd>Neorg index<cr>", desc = "Index" },
      { "<leader>nq", "<cmd>Neorg return<cr>", desc = "Return", ft = "norg" },
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
