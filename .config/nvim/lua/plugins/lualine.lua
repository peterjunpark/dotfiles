return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "tokyonight",
    },
    sections = {
      -- disable clock in status line
      lualine_z = {},
    },
    extensions = { "oil", "lazy" },
  },
}
