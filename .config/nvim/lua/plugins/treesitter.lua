return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
    ensure_installed = {
      "cpp",
      "cmake",
      "css",
      "c_sharp",
      "diff",
      "dockerfile",
      "eex",
      "elixir",
      "fish",
      "go",
      "gomod",
      "graphql",
      "heex",
      "html",
      "http",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "prisma",
      "python",
      "query",
      "regex",
      "rust",
      "scss",
      "sql",
      "styled",
      "svelte",
      "toml",
      "tsx",
      "typescript",
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
