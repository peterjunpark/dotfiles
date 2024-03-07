return {
  "echasnovski/mini.files",
  keys = function()
    return {
      {
        "<leader>e",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "File Explorer",
      },
      {
        "<leader>E",
        function()
          require("mini.files").open(vim.loop.cwd(), true)
        end,
        desc = "File Explorer (cwd)",
      },
    }
  end,
}
