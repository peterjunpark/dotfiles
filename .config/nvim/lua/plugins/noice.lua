return {
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
}
