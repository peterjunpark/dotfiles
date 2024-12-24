local map = require('custom.helpers').keymap

-- Move up and down through wrapped lines
map('j', 'gj')
map('k', 'gk')

-- Don't yank on x
map('x', '"_x')

-- Move lines up and down in visual mode.
map('J', ":m '>+1<CR>gv=gv", 'Move line down', 'v')
map('K', ":m '<-2<CR>gv=gv", 'Move line up', 'v')

-- Cycle through buffers.
map('<Tab>', '<cmd>bnext<CR>')
map('<Backspace>', '<cmd>bprev<CR>')

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('<leader>x', vim.diagnostic.setloclist, 'Open quickfix list')

-- Terminal keymaps
map('<leader>t', function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd 'J'
	vim.api.nvim_win_set_height(0, 15)
end, 'Terminal')
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc.
map('<Esc><Esc>', '<C-\\><C-n>', 'Exit terminal mode', 't')

-- Lua
map('<leader>L', '<cmd>source %<CR>', 'Lua: Source file')
map('<leader>l', ':.lua<CR>', 'Lua: Execute line')
map('<leader>l', ':lua<CR>', 'Lua: Execute selection', 'v')
