local add = MiniDeps.add
local map = function(keys, func, desc, mode)
	mode = mode or 'n'
	vim.keymap.set(mode, keys, func, { desc = desc })
end

require('mini.git').setup()
require('mini.diff').setup()
require('mini.ai').setup { n_lines = 500 }

-- require('mini.indentscope').setup({
-- 	 symbol = "│",
-- 	 options = { try_as_border = true },
-- })
--  vim.api.nvim_create_autocmd("FileType", {
--      pattern = {
--        "help",
--        "mason",
--        "oil",
--        "notify",
--      },
--      callback = function()
--        vim.b.miniindentscope_disable = true
--      end,
--    })

require('mini.surround').setup()

require('mini.bufremove').setup()

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
	-- statuscolumn = { enabled = true },
}

vim.api.nvim_create_autocmd('User', {
	pattern = 'MiniFilesActionRename',
	callback = function(event)
		Snacks.rename.on_rename_file(event.data.from, event.data.to)
	end,
})

map('<leader>g', function()
	Snacks.lazygit()
end, 'Lazygit')

map('<leader>s', function()
	Snacks.scratch()
end, 'Scratch')

map('<leader>S', function()
	Snacks.scratch.select()
end, 'Scratch: Select')

add {
	source = 'MeanderingProgrammer/render-markdown.nvim',
}

local rendermd = require 'render-markdown'
rendermd.setup()

map('<leader>tm', function()
	rendermd.toggle()
end, 'Render markdown')
