-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local discipline = require("custom.vim-discipline")
discipline.cowboy()

local key = vim.keymap
local opts = { silent = true, noremap = true }

opts.desc = "Lsp Restart"
key.set("n", "<leader>cL", "<cmd>LspRestart<CR>", opts)

-- yeet to black hole register on x
key.set("n", "x", '"_x', opts)

-- restore default H and L
key.set({ "n", "v" }, "<S-h>", "<S-h>") -- prev buffer in lazyvim
key.set({ "n", "v" }, "<S-l>", "<S-l>") -- next buffer in lazyvim

opts.desc = "Toggle dark/light mode"
key.set("n", "<leader>um", function()
  if vim.o.background == "light" then
    vim.o.background = "dark"
  else
    vim.o.background = "light"
  end
end, opts)
