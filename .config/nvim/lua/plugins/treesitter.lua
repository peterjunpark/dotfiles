return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
    ensure_installed = {
      -- rust-related
      "ron",
      "rust",
      -- elixir-related
      "eex",
      "elixir",
      "heex",
      -- lua-related
      "lua",
      "luadoc",
      "luap",
      -- web dev
      "css",
      "html",
      "graphql",
      "javascript",
      "jsdoc",
      "prisma",
      "scss",
      "styled",
      "svelte",
      "tsx",
      "typescript",
      --
      "cmake",
      "cpp",
      "c_sharp",
      "diff",
      "dockerfile",
      "fish",
      "http",
      "json",
      "jsonc",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "sql",
      "toml",
      "yaml",
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    -- mdx
    vim.filetype.add({
      extension = {
        mdx = "mdx",
      },
    })
    vim.treesitter.language.register("markdown", "mdx")
  end,
}
