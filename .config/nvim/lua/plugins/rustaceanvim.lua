return {
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    -- opts = {
    --   -- server = {
    --   --   on_attach = function(_, bufnr)
    --   --
    --   --   end
    --   -- },
    -- },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {},
      },
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
  { -- this package comes with LazyVim's Rust extra,
    -- but the project is now archived.
    -- i replace with rustaceanvim
    "simrat39/rust-tools.nvim",
    enabled = false,
  },
}
