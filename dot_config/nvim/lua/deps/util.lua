local add = MiniDeps.add
local map = require('custom.helpers').keymap

add { source = 'echasnovski/mini.bufremove' }
require('mini.bufremove').setup()

add { source = 'folke/snacks.nvim' }
require('snacks').setup {
	bigfile = { enabled = true },
	indent = {
		only_current = true,
		only_scope = true,
	},
	input = {
		win = {
			border = 'single',
			title_pos = 'left',
		},
	},
	lazygit = { configure = true },
	scratch = {
		ft = 'markdown',
		win = { border = 'single' },
	},
	statuscolumn = { enabled = true },
}

map('<leader>q', function()
	Snacks.bufdelete()
end, 'Delete buffer')

map('<leader>G', function()
	Snacks.lazygit()
end, 'Lazygit')

map('<leader>s', function()
	Snacks.scratch()
end, 'Scratch')

map('<leader>S', function()
	Snacks.scratch.select()
end, 'Scratch: Select')
