return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "moon",
      styles = {
        keywords = { italic = false },
      },
      on_highlights = function(hl, c)
        hl.DashboardHeader = {
          fg = c.purple,
        }
        hl.DashboardKey = {
          fg = c.magenta,
        }
        hl.MiniIndentscopeSymbol = {
          fg = c.blue0,
        }
      end,
    },
  },
}
