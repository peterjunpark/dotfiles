local add = MiniDeps.add
local map = require('custom.helpers').keymap

-- Comment
add { source = 'JoosepAlviste/nvim-ts-context-commentstring' }
require('ts_context_commentstring').setup {
	enable_autocmd = false,
}

add { source = 'echasnovski/mini.comment' }
require('mini.comment').setup {
	options = {
		custom_commentstring = function()
			return require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
		end,
	},
}

-- Around/inside
add { source = 'echasnovski/mini.ai' }
require('mini.ai').setup { n_lines = 500 }

-- Autopairs
add { source = 'echasnovski/mini.pairs' }
require('mini.pairs').setup {
	modes = { insert = true, command = true, terminal = false },
	-- skip autopair when next character is one of these
	skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
	-- skip autopair when the cursor is inside these treesitter nodes
	skip_ts = { 'string' },
	-- skip autopair when next character is closing pair
	-- and there are more closing pairs than opening pairs
	skip_unbalanced = true,
	-- better deal with markdown code blocks
	markdown = true,
}

-- Surround with s
add { source = 'echasnovski/mini.surround' }
require('mini.surround').setup()

-- Prettify markdown
add {
	source = 'MeanderingProgrammer/render-markdown.nvim',
}

local rendermd = require 'render-markdown'
rendermd.setup()

map('<leader>om', function()
	rendermd.toggle()
end, 'Toggle: Render markdown')
