return {
  -- color scheme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      dark_variant = "main",
      highlight_groups = {
        TelescopeBorder = { fg = "surface", bg = "surface" },
        TelescopeNormal = { fg = "subtle", bg = "overlay" },
        TelescopeSelection = { fg = "text", bg = "highlight_med" },
        TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
        TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },
        TelescopeTitle = { fg = "base", bg = "pine" },
        TelescopePromptTitle = { fg = "base", bg = "iris" },
        TelescopePreviewTitle = { fg = "base", bg = "love" },
        TelescopePromptNormal = { fg = "text", bg = "overlay" },
        TelescopePromptBorder = { fg = "surface", bg = "surface" },
        DashboardHeader = { fg = "iris", bg = "base" },
        DashboardFooter = { fg = "pine", bg = "base" },
        MiniAnimateCursor = { fg = "none", bg = "highlight_high" },
        -- this is for oil.nvim ... DOESN'T WORK RN TODO:
        FloatTitle = { fg = "base", bg = "iris" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      -- classic command line
      cmdline = {
        view = "cmdline",
      },
      -- fix "No information available" notification spam when hovering typescript
      lsp = {
        hover = {
          silent = true,
        },
      },
      -- disable pop-up for incremental rename
      presets = {
        inc_rename = false,
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
      },
      sections = {
        -- disable clock in status line
        lualine_z = {},
      },
      extensions = { "oil", "lazy" },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[

███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
                                                  
              ]]
      logo = string.rep("\n", 5) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
  {
    -- remove useless entries in which-key
    "folke/which-key.nvim",
    opts = {
      key_labels = {
        ["<ScrollWheelUp>"] = "",
        ["<ScrollWheelDown>"] = "",
        ["<M-i>"] = "",
      },
    },
  },
}
