return {
  "hedyhli/outline.nvim",
  opts = {
    keymaps = {
      up_and_jump = "<C-p>",
      down_and_jump = "<C-n>",
    },
    outline_window = {
      width = 50,
    },
  },
  keys = {
    { "<leader>cs", "<cmd>Outline!<cr>", desc = "Outline" },
    { "<leader>ws", "<cmd>Outline<cr>", desc = "Outline (Vsplit)" },
  },
}
