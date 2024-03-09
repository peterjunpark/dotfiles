return {
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
      style_preset = require("bufferline").style_preset.no_italic,
    },
  },
}
