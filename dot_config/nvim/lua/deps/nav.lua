local add = MiniDeps.add
local map = require('custom.helpers').keymap

-- Fuzzy finder
add { source = 'echasnovski/mini.pick' }
require('mini.pick').setup()

add { source = 'echasnovski/mini.extra' }
require('mini.extra').setup()

map('<leader>b', MiniPick.builtin.buffers, 'Pick: Buffers')
map('<leader>f', MiniPick.builtin.files, 'Pick: Files')
map('<leader>/', MiniPick.builtin.grep_live, 'Pick: Live grep')
map('<leader>?', MiniPick.builtin.help, 'Pick: Help')
map('<leader>.', MiniPick.builtin.resume, 'Pick: Resume')
map('<leader>pn', function()
	local opts = { source = { cwd = vim.fn.stdpath 'config' } }
	MiniPick.builtin.files { opts = opts }
end, 'Pick: Neovim config')

-- Filetree editor
add { source = 'stevearc/oil.nvim' }

local oil = require 'oil'
local detail = false

oil.setup {
	default_file_explorer = true,
	skip_confirm_for_simple_edits = true,
	view_options = {
		show_hidden = true,
	},
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
	confirmation = {
		border = 'single',
	},
	ssh = {
		border = 'single',
	},
	keymaps_help = {
		border = 'single',
	},
}

map('<leader>e', oil.open, 'Oil: Current dir')
