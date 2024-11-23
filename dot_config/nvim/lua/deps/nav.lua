local add = MiniDeps.add
local map = function(keys, func, desc, mode)
	mode = mode or 'n'
	vim.keymap.set(mode, keys, func, { desc = desc })
end

require('mini.pick').setup()

map('<leader>f', MiniPick.builtin.files, 'Files')
map('<leader>g', MiniPick.builtin.grep_live, 'Grep')
map('<leader>/h', MiniPick.builtin.help, 'Help')
map('<leader>/.', MiniPick.builtin.resume, 'Resume')

add { source = 'stevearc/oil.nvim' }

local oil = require 'oil'
local detail = false

oil.setup {
	default_file_explorer = true,
	keymaps = {
		['q'] = 'actions.close',
		['<CR>'] = 'actions.select',
		['<C-v>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open the entry in a vertical split' },
		['<C-x>'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open the entry in a horizontal split' },
		['<C-t>'] = { 'actions.select', opts = { tab = true }, desc = 'Open the entry in new tab' },
		['<C-p>'] = 'actions.preview',
		['<C-l>'] = 'actions.refresh',
		['g?'] = 'actions.show_help',
		['gd'] = {
			desc = 'Toggle file detail view',
			callback = function()
				detail = not detail
				if detail then
					require('oil').set_columns { 'icon', 'permissions', 'size', 'mtime' }
				else
					require('oil').set_columns { 'icon' }
				end
			end,
		},
		['-'] = 'actions.parent',
		['_'] = 'actions.open_cwd',
		['`'] = 'actions.cd',
		['~'] = { 'actions.cd', opts = { scope = 'tab' }, desc = ':tcd to the current oil directory' },
		['gs'] = 'actions.change_sort',
		['gx'] = 'actions.open_external',
		['g.'] = 'actions.toggle_hidden',
		['g\\'] = 'actions.toggle_trash',
	},
}

map('<leader>e', oil.open, 'Explorer')

add { source = 'ThePrimeagen/harpoon', checkout = 'harpoon2', depends = { 'nvim-lua/plenary.nvim' } }

local harpoon = require 'harpoon'

harpoon:setup()

vim.keymap.set('n', '<leader>H', function()
	harpoon:list():add()
end)
vim.keymap.set('n', '<leader>h', function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set('n', '<leader>1', function()
	harpoon:list():select(1)
end)
vim.keymap.set('n', '<leader>2', function()
	harpoon:list():select(2)
end)
vim.keymap.set('n', '<leader>3', function()
	harpoon:list():select(3)
end)
vim.keymap.set('n', '<leader>4', function()
	harpoon:list():select(4)
end)

