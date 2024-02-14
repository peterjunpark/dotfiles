-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- local discipline = require("custom.vim-discipline")
-- discipline.cowboy()

local key = vim.keymap
local opts = { silent = true, noremap = true }

opts.desc = "Lsp Restart"
key.set("n", "<leader>cL", "<cmd>LspRestart<CR>", opts)

-- yeet to black hole register on x

-- restore default H and L
opts.desc = "Top of viewport"
key.set({ "n", "v" }, "<S-h>", "<S-h>") -- prev buffer in lazyvim
opts.desc = "Bottom of viewport"
key.set({ "n", "v" }, "<S-l>", "<S-l>") -- next buffer in lazyvim

-- easier ^ and g_
opts.desc = "First non-blank in line"
key.set({ "n", "v" }, "gh", "^", opts)
opts.desc = "Last non-blank in line"
key.set({ "n", "v" }, "gl", "g_", opts)
