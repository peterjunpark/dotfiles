return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "tokyonight",
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
    },
    extensions = { "fugitive", "lazy", "man", "mason", "nvim-dap-ui", "oil", "symbols-outline", "trouble" },
  },
}
