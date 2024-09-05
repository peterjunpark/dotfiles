local add = MiniDeps.add

add {
	source = 'rose-pine/neovim',
	name = 'rose-pine',
}

require('rose-pine').setup {
	highlight_groups = {
		-- Highlight on search
		CurSearch = { fg = 'base', bg = 'leaf', inherit = false },
		Search = { fg = 'text', bg = 'leaf', blend = 20, inherit = false },

		MiniIndentscopeSymbol = { fg = 'leaf' },
		MiniStatuslineModeInsert = { bg = 'iris' },
		MiniStatuslineModeVisual = { bg = 'foam' },
		MiniStatuslineModeCommand = { bg = 'leaf' },
		MiniStatuslineModeOther = { bg = 'love' },
	},
}

vim.cmd.colorscheme 'rose-pine'

require('mini.icons').setup()

require('mini.notify').setup()

local statusline = require 'mini.statusline'
statusline.setup {}
-- You can configure sections in the statusline by overriding their
-- default behavior. For example, here we set the section for
-- cursor location to LINE:COLUMN
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
	return '%2l::%-2v'
end

local clue = require 'mini.clue'
clue.setup {
	window = {
		delay = 240,
	},
	triggers = {
		-- Leader triggers
		{ mode = 'n', keys = '<leader>' },
		{ mode = 'x', keys = '<leader>' },

		-- Built-in completion
		{ mode = 'i', keys = '<C-x>' },

		-- `g` key
		{ mode = 'n', keys = 'g' },
		{ mode = 'x', keys = 'g' },

		-- Marks
		{ mode = 'n', keys = "'" },
		{ mode = 'n', keys = '`' },
		{ mode = 'x', keys = "'" },
		{ mode = 'x', keys = '`' },

		-- Registers
		{ mode = 'n', keys = '"' },
		{ mode = 'x', keys = '"' },
		{ mode = 'i', keys = '<C-r>' },
		{ mode = 'c', keys = '<C-r>' },

		-- Window commands
		{ mode = 'n', keys = '<C-w>' },

		-- `z` key
		{ mode = 'n', keys = 'z' },
		{ mode = 'x', keys = 'z' },
	},

	clues = {
		{ mode = 'n', keys = '<leader>p', desc = 'Pick' },
		{ mode = 'n', keys = '<leader>t', desc = 'Toggle' },
		clue.gen_clues.builtin_completion(),
		clue.gen_clues.g(),
		clue.gen_clues.marks(),
		clue.gen_clues.registers(),
		clue.gen_clues.windows(),
		clue.gen_clues.z(),
	},
}

require('mini.starter').setup {
	evaluate_single = true,
}

require('mini.tabline').setup()
