local add = MiniDeps.add

require('mini.sessions').setup()

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

add { source = 'hat0uma/csvview.nvim' }
require('csvview').setup()

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
	lazygit = { enabled = true },
	statuscolumn = { enabled = true },
}
