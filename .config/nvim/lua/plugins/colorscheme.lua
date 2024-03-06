return {
  -- color scheme
  "folke/tokyonight.nvim",
  opts = {
    style = "moon",
    light_style = "night",
    styles = {
      comments = { italic = false },
      keywords = { italic = false },
    },
    on_highlights = function(hl, c)
      local prompt = "#2d3149"
      hl.TelescopeNormal = {
        bg = c.bg_dark,
        fg = c.fg_dark,
      }
      hl.TelescopeBorder = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopePromptNormal = {
        bg = prompt,
      }
      hl.TelescopePromptBorder = {
        bg = prompt,
        fg = prompt,
      }
      hl.TelescopePromptTitle = {
        bg = c.purple,
        fg = prompt,
      }
      hl.TelescopePreviewTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopeResultsTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.FloatTitle = {
        bg = c.purple,
        fg = c.bg_dark,
      }
      hl.DashboardHeader = {
        fg = c.purple,
      }
      hl.DashboardKey = {
        fg = c.magenta,
      }
      hl.MiniIndentscopeSymbol = {
        fg = c.green,
      }
    end,
  },
}
