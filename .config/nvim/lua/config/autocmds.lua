-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- get rid of conceal in these filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown", "mdx" },
  callback = function()
    vim.wo.spell = false
    -- default conceallevel is 3
    vim.wo.conceallevel = 0
  end,
})
