local add = MiniDeps.add

-- Colorscheme
add {
	source = 'rose-pine/neovim',
	name = 'rose-pine',
}
require('rose-pine').setup {
	palette = {
		main = {
			leaf = '#5cc1a3',
		},
	},
	groups = {
		git_add = 'leaf'
	},
	highlight_groups = {
		-- Syntax highlighting
		['@constant'] = { fg = 'leaf' },
		['@markup.link.label'] = { fg = 'text', italic = true },
		['@tag.attribute'] = { fg = 'rose' },
		Number = { fg = 'leaf' },
		Operator = { fg = 'pine' },
	},
}
vim.cmd.colorscheme 'rose-pine'

-- Icons
add { source = 'echasnovski/mini.icons' }
require('mini.icons').setup()

-- Notifications
add { source = 'echasnovski/mini.notify' }
require('mini.notify').setup()

add { source = 'akinsho/bufferline.nvim' }
require('bufferline').setup()

add { source = 'folke/which-key.nvim' }
local wk = require 'which-key'
wk.setup {
	preset = 'helix',
	win = {
		border = 'single',
	},
}

add { source = 'nvim-lualine/lualine.nvim' }
local lualine = require 'lualine'
local rp = require 'rose-pine.palette'

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = rp.base,
  fg       = rp.text,
  yellow   = rp.gold,
  cyan     = rp.rose,
  darkblue = rp.foam,
  green    = rp.pine,
  orange   = rp.leaf,
  violet   = rp.iris,
  magenta  = rp.iris,
  blue     = rp.foam,
  red      = rp.love,
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand '%:t') ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand '%:p:h'
		local gitdir = vim.fn.finddir('.git', filepath .. ';')
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = '',
		section_separators = '',
		theme = {
			-- We are going to use lualine_c an lualine_x as left and
			-- right section. Both are highlighted by c theme .  So we
			-- are just setting default looks o statusline
			normal = { c = { fg = colors.fg, bg = colors.bg } },
			inactive = { c = { fg = colors.fg, bg = colors.bg } },
		},
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left {
	function()
		return '▊'
	end,
	-- color = { fg = colors.blue }, -- Sets highlighting of component
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.red,
			i = colors.green,
			v = colors.blue,
			[''] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[''] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			['r?'] = colors.cyan,
			['!'] = colors.red,
			t = colors.red,
		}
		return { fg = mode_color[vim.fn.mode()] }
	end,
	padding = { left = 0, right = 1 }, -- We don't need space before this
}
--
-- ins_left {
-- 	-- mode component
-- 	function()
-- 		return ''
-- 	end,
-- 	color = function()
-- 		-- auto change color according to neovims mode
-- 		local mode_color = {
-- 			n = colors.red,
-- 			i = colors.green,
-- 			v = colors.blue,
-- 			[''] = colors.blue,
-- 			V = colors.blue,
-- 			c = colors.magenta,
-- 			no = colors.red,
-- 			s = colors.orange,
-- 			S = colors.orange,
-- 			[''] = colors.orange,
-- 			ic = colors.yellow,
-- 			R = colors.violet,
-- 			Rv = colors.violet,
-- 			cv = colors.red,
-- 			ce = colors.red,
-- 			r = colors.cyan,
-- 			rm = colors.cyan,
-- 			['r?'] = colors.cyan,
-- 			['!'] = colors.red,
-- 			t = colors.red,
-- 		}
-- 		return { fg = mode_color[vim.fn.mode()] }
-- 	end,
-- 	padding = { right = 1 },
-- }

-- ins_left {
-- 	-- filesize component
-- 	'filesize',
-- 	cond = conditions.buffer_not_empty,
-- }

ins_left {
	'filename',
	cond = conditions.buffer_not_empty,
	color = { fg = colors.magenta, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left {
	'diagnostics',
	sources = { 'nvim_diagnostic' },
	symbols = { error = ' ', warn = ' ', info = ' ' },
	diagnostics_color = {
		error = { fg = colors.red },
		warn = { fg = colors.yellow },
		info = { fg = colors.cyan },
	},
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
	function()
		return '%='
	end,
}

ins_left {
	-- Lsp server name .
	function()
		local msg = 'No active LSP'
		local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
		local clients = vim.lsp.get_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = ' LSP:',
	color = { fg = '#ffffff', gui = 'bold' },
}

-- Add components to right sections
ins_right {
	'o:encoding', -- option component same as &encoding in viml
	fmt = string.upper, -- I'm not sure why it's upper case either ;)
	cond = conditions.hide_in_width,
	color = { fg = colors.green, gui = 'bold' },
}

ins_right {
	'fileformat',
	fmt = string.upper,
	icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
	color = { fg = colors.green, gui = 'bold' },
}

ins_right {
	'branch',
	icon = '',
	color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
	'diff',
	symbols = { added = ' ', modified = ' ', removed = ' ' },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
	cond = conditions.hide_in_width,
}

ins_right {
	function()
		return '▊'
	end,
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.red,
			i = colors.green,
			v = colors.blue,
			[''] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[''] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			['r?'] = colors.cyan,
			['!'] = colors.red,
			t = colors.red,
		}
		return { fg = mode_color[vim.fn.mode()] }
	end,
	padding = { left = 1 },
}

lualine.setup(config)
