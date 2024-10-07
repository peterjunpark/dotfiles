local add = MiniDeps.add

		add({ source = 'folke/tokyonight.nvim'})
		add({ source= 'rose-pine/neovim', name='rose-pine' })

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

    local starter = require 'mini.starter'
    local pad = string.rep(' ', 20)
    local s_section = function(name, action, section)
      return { name = name, action = action, section = pad .. section }
    end

    starter.setup {
      evaluate_single = true,
      items = {
        s_section('New file', 'ene | startinsert', ''),
        s_section('Restore session', MiniSessions.read, ''),
        s_section('Plugins', 'Lazy', ''),
        s_section('Quit', 'qa', ''),
      },
      footer = "  peterjunpark",
    }

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
