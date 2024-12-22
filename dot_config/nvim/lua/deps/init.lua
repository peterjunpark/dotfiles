local path_package = vim.fn.stdpath 'data' .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.deps'
if not vim.loop.fs_stat(mini_path) then
	vim.cmd 'echo "Installing `mini.deps`" | redraw'
	local clone_cmd = {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/echasnovski/mini.deps',
		mini_path,
	}
	vim.fn.system(clone_cmd)
	vim.cmd 'packadd mini.deps | helptags ALL'
	vim.cmd 'echo "Installed `mini.deps`" | redraw'
end

require('mini.deps').setup { path = { package = path_package } }
local map = require('custom.helpers').keymap
map('<leader>od', '<cmd>DepsUpdate<CR>', 'Plugins: Update')

local now, later = MiniDeps.now, MiniDeps.later
local modules = {
	'util',
	'ui',
	'nav',
	'ts',
	'lsp',
	'edit'
}

for _, module in ipairs(modules) do
	now(function()
		require('deps.' .. module)
	end)
end

later(function()
	require 'deps.lsp'
end)
later(function()
	require 'deps.fmt'
end)
later(function()
	require 'deps.git'
end)
