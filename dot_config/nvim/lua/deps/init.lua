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

vim.keymap.set('n', '<leader>od', '<cmd>DepsUpdate<CR>', { desc = 'Deps: Update' })

local now, later = MiniDeps.now, MiniDeps.later

local load_now = { 'ui', 'util', 'nav', 'ts' }
local load_later = { 'lsp', 'fmt', 'git', 'edit' }

local function load_deps(modules, loader)
	for _, m in ipairs(modules) do
		loader(function()
			if not pcall(require, 'deps.' .. m) then
				vim.cmd('echohl ErrorMsg | echo "Failed to load module `deps.' .. m .. '`" | echohl None')
			end
		end)
	end
end
load_deps(load_now, now)
load_deps(load_later, later)
