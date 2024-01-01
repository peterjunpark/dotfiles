return {
  -- color scheme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = "moon",
      dark_variant = "moon",
      highlight_groups = {
        TelescopeBorder = { fg = "overlay", bg = "overlay" },
        TelescopeNormal = { fg = "subtle", bg = "overlay" },
        TelescopeSelection = { fg = "text", bg = "highlight_med" },
        TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
        TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },
        TelescopeTitle = { fg = "base", bg = "love" },
        TelescopePromptTitle = { fg = "base", bg = "pine" },
        TelescopePreviewTitle = { fg = "base", bg = "iris" },
        TelescopePromptNormal = { fg = "text", bg = "surface" },
        TelescopePromptBorder = { fg = "surface", bg = "surface" },
        MiniIndentscopeSymbol = { fg = "iris", bg = "base" },
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
    -- disable clock in status line
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_z = {},
      },
    },
  },
  {
    -- remove x icons in tabs
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
      { "<Backspace>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous Buffer" },
    },
    opts = {
      options = {
        show_buffer_close_icons = false,
        show_close_icons = false,
      },
    },
  },
  {
    -- change indent scope line from solid to dashed
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "╎",
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
