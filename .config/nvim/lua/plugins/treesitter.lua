return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
    ensure_installed = {
      -- docs
      "rst",
      "markdown",
      "markdown_inline",
      -- rust-related
      "ron",
      "rust",
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
      "scss",
      "styled",
      "tsx",
      "typescript",
      --
      "cmake",
      "cpp",
      "diff",
      "dockerfile",
      "fish",
      "http",
      "json",
      "jsonc",
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
