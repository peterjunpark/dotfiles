local add = MiniDeps.add
local ferra = {
	night = '#2b292d',
	ash = '#383539',
	umber = '#4d424b',
	bark = '#6f5d63',
	mist = '#d1d1e0',
	sage = '#b1b695',
	blush = '#fecdb2',
	coral = '#ffa07a',
	rose = '#f6b6c9',
	ember = '#e06b75',
	honey = '#f5d76e',
}

add({ source = 'folke/tokyonight.nvim'})

require('tokyonight').setup({
	style = 'night',
	-- on_colors = function(colors)
	-- 	colors.bg = ferra.night
	-- end
})

vim.cmd.colorscheme 'tokyonight-night'

  require('mini.icons').setup()

  require('mini.notify').setup()

    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup()
    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l::%-2v'
    end

local clue = require('mini.clue')
clue.setup({
  triggers = {
    -- Leader triggers
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },

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
    -- Enhance this by adding descriptions for <Leader> mapping groups
    clue.gen_clues.builtin_completion(),
    clue.gen_clues.g(),
    clue.gen_clues.marks(),
    clue.gen_clues.registers(),
    clue.gen_clues.windows(),
    clue.gen_clues.z(),
  },
})

require('mini.tabline').setup()
