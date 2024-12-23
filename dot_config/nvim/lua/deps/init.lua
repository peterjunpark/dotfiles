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
local load_now = {
	'util',
	'ui',
	'nav',
	'ts',
}
local load_later = {
	'lsp',
	'fmt',
	'git',
	'edit',
}

for _, m in ipairs(load_now) do
	now(function()
		require('deps.' .. m)
	end)
end

for _, m in ipairs(load_later) do
	later(function()
		require('deps.' .. m)
	end)
end
