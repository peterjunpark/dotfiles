local add = MiniDeps.add
local map = require('custom.helpers').keymap

add { source = 'echasnovski/mini.bufremove' }
require('mini.bufremove').setup()

add { source = 'echasnovski/mini.hipatterns' }
local hipatterns = require 'mini.hipatterns'
hipatterns.setup {
	highlighters = {
		fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
		hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
		todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
		note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
}

add { source = 'folke/snacks.nvim' }
require('snacks').setup {
	bigfile = { enabled = true },
	lazygit = { configure = true },
	scratch = {
		ft = 'markdown',
		win = { border = 'single' },
	},
	statuscolumn = { enabled = true },
}

map('<leader>G', function()
	Snacks.lazygit()
end, 'Lazygit')

map('<leader>s', function()
	Snacks.scratch()
end, 'Scratch')

map('<leader>S', function()
	Snacks.scratch.select()
end, 'Scratch: Select')
